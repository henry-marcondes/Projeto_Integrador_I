from flask import Flask, jsonify, request, render_template
import mysql.connector

app = Flask(__name__)

registro_calculo = []  # Lista para armazenar os registros selecionados
dicionario_unico = {}  # Dicionario para armazenar item selecionados pelo usuario
total_carga = 0  # Total da carga de consumo Watts
tota_fonte = 0  # Total da fonte geradora em Watts
diferenca = []  # usada para atualizar a var local fonte


def conectar_banco():
    return mysql.connector.connect(
        host="127.0.0.1",  # Altere conforme necessário
        user="henry",  # Altere conforme necessário
        password="55631376",  # Altere conforme necessário
        database="ENERGIA",  # Nome banco de dados *** cuidado ao atualizar o banco de dados ***
        # talves seja o caso de criar um VIEM para os adm.( não sei fazer)
    )


@app.route("/")  # a pagina inicial
def index():
    return render_template("index.html")


@app.route("/tabelas")  # Conecta o Banco para colocar definir as colunas
def obter_tabelas():
    conexao = conectar_banco()
    cursor = conexao.cursor()
    cursor.execute("SHOW TABLES")
    tabelas = [t[0] for t in cursor.fetchall()]
    cursor.close()
    conexao.close()
    return jsonify(tabelas)


@app.route("/dados", methods=["GET"])
def dados():
    tabela = request.args.get("tabela", "").upper()  # Captura o parâmetro GET
    if not tabela:
        return jsonify({"erro": "Nenhuma tabela foi informada"}), 400

    dados = consultar_dados_do_banco(tabela)
    return jsonify(dados)


def consultar_dados_do_banco(tabela):
    print(f"RECEBIDO: {tabela}")  # Debug Terminal
    conexao = conectar_banco()
    cursor = conexao.cursor(dictionary=True)

    # Lista de tabelas permitidas (evita SQL Injection)
    tabelas_permitidas = ["GELADEIRA", "BATERIA", "CLIMATIZADOR", "BOMBA_DAGUA", "TV"]

    if tabela not in tabelas_permitidas:
        print("Tabela não permitida!")
        return []

    # Executa consulta SQL segura
    com_sql = f"SELECT * FROM {tabela};"

    try:
        cursor.execute(com_sql)
        dados = cursor.fetchall()
        print(f"Resultados encontrados: {len(dados)} registros")
    except Exception as e:
        print(f"Erro ao executar SQL: {e}")
        dados = []  # Retorna lista vazia em caso de erro

    cursor.close()
    conexao.close()

    return dados


from collections import defaultdict


@app.route("/salvar_registro", methods=["POST"])
def salvar_registro():
    global registro_calculo
    global dicionario_unico, diferenca
    try:
        # Recebe os dados do Front-end "Testado OK"
        dados = request.get_json()  # Obtém os dados enviados pelo JavaScript
        print(f"Dados processados: {dados}")  # Debug

        # Evita duplicatas antes de adicionar
        if dados not in registro_calculo:
            registro_calculo.append(dados)

        # Agrupa registros no dicionário sem sobrescrever
        dicionario_unico = defaultdict(
            list
        )  # Cria uma lista dentro da registro exe: {k1:[2,1,3], k2:[1]}
        for item in registro_calculo:
            dicionario_unico[item["tabela"]].append(item["potencia"])

        print(f"Lista atualizada: {dict(dicionario_unico)}")  # Debug no terminal
        # Seleciona apenas as chaves do dicionario e coloca numa lista
        fonte = list(set(dicionario_unico.keys()))
        print(f"fonte: {fonte}")  # DEBUG no terminal
        # Se a lista diferenca estiver vazia ...
        if not diferenca:
            diferenca = fonte
            a = diferenca[0]  # retira da lista e torna uma variavel string
            # diferenca.append(a) #  *** Verificar é necessário ?? ***
            verificar_opcao(a)  # Extrai o campo Watts e trata
            print(f"diferença = {diferenca}")
        else:  # Caso contrario ...
            # subtrai a lista fonte da lista diferenca p/ obter item
            # selecionado pelo usuario no Front-End
            b = list(set(fonte) - set(diferenca))
            # Transforma em string
            a = b[0]
            diferenca.append(a)  # atualiza a lista
            print(f"var a = {a}")  # Debug Terminal
            verificar_opcao(a)  # trata a opção

        return jsonify({"mensagem": "Registro salvo com sucesso!", "dados": dados}), 200
    except Exception as e:
        return jsonify({"erro": f"Erro ao processar o registro: {str(e)}"}), 400


def verificar_opcao(opcao):
    # Variaveis para o calculo da autonomia da bateria Watts/h
    # Recebe as entadas do usuario em (opcao) extrai os Watts
    # de acordo com o item selecionado
    # OBS: todos os itens abaixo, no Banco de dados, tem os mesmos campos
    # Retorna as variaveis total_carga recebe as cargas de consumo
    # e tota_fonte recebe as fontes que envolvem alem da bateria a
    # PL_SOLAR e USINA *** Falta fazer o algoritmo para esses itens ***
    global total_carga, tota_fonte

    match opcao:
        case "BATERIA":
            # Pode ser mais de uma bateria porem sempre
            # com a mesma potencia caso contrario desbalanceia
            # e detroi a bateria de menor potencia.
            # *** implementar versões futuras*** penso em chamar uma função pra isso
            a = dicionario_unico.get("BATERIA", [0])
            tota_fonte += a[0]

        case "PL_SOLAR":
            a = dicionario_unico.get("PL_SOLAR", [0])

        case "USINA":
            a = dicionario_unico.get("USINA", [0])

        case "AR_CONDICIONADO":
            a = dicionario_unico.get("AR_CONDICIONADO", [0])
            total_carga += a[0]

        case "BOMBA_AGUA":
            a = dicionario_unico.get("BOMBA_AGUA", [0])
            total_carga += a[0]

        case "INVERSOR":
            a = dicionario_unico.get("INVERSOR", [0])
            total_carga += a[0]

        case "CLIMATIZADOR":
            a = dicionario_unico.get("CLIMATIZADOR", [0])
            total_carga += a[0]

        case "CONTROLADORA":
            a = dicionario_unico.get("CONTROLADORA", [0])

        case "DIVERSOS":
            # Envolve a quantidade de USB e Iluminação entre outros
            # itens, muito comum ventuinhas exaustor banheiro e "C-pap"
            a = dicionario_unico.get("DIVERSOS", [0])
            for i in a:
                total_carga += a[i]

            print("total + DIVERSOS %d", total_carga)
        case "GELADEIRA":
            a = dicionario_unico.get("GELADEIRA", [None])
            total_carga += a[0]

        case "TV":
            a = dicionario_unico.get("TV", [None])
            total_carga += a[0]

        case _:
            print("Comando inválido!")

    print(f" Fonte = {tota_fonte:.2f}\n Carga = {total_carga:.2f}")  # Debug terminal
    # return tota_fonte, total_carga


def calculo_de_consumo(gerador, consumidor):
    # PL_SOLAR e USINA *** Falta fazer o algoritmo para esses itens ***
    # PL_SOLAR depende diretamente das condições tempo(chuvoso,nublado, ensolarado)
    # Alem das estações do ano e dia e noite.
    # *** implementar *** No momento vamos vou apenas considerar a potencia da
    # BATERIA
    tempo = gerador / consumidor
    print(f"Tempo : {tempo:.2f}")


@app.route("/obter_dados_grafico", methods=["GET"])
def obter_dados_grafico():
    global tota_fonte, total_carga

    if total_carga == 0:
        return jsonify({"sucesso": False, "erro": "Carga total não definida"}), 400

    tempo = tota_fonte / total_carga if total_carga > 0 else 0
    pontos = 11  # Número de pontos no gráfico
    tempo_x = [tempo * i / (pontos - 1) for i in range(pontos)]  # Eixo X
    fonte_y = [
        tota_fonte * (1 - i / (pontos - 1)) for i in range(pontos)
    ]  # Descarga linear o ideal é implementar uma função
    # print(fonte_y)
    return jsonify({"sucesso": True, "tempo": tempo_x, "tota_fonte": fonte_y})


@app.route("/resetar_dados", methods=["POST"])
def resetar_dados():
    global tota_fonte, total_carga, registro_calculo, dicionario_unico, diferenca  # Certifique-se de definir essas variáveis globalmente
    registro_calculo = []  # Lista para armazenar os registros selecionados
    dicionario_unico = {}  # Dicionario para armazenar item selecionados pelo usuario
    total_carga = 0  # Total da carga de consumo Watts
    tota_fonte = 0  # Total da fonte geradora em Watts
    diferenca = []  # usada para atualizar a var local fonte
    return jsonify({"sucesso": True, "mensagem": "Dados resetados com sucesso"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
