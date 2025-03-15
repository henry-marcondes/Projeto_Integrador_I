from flask import Flask, jsonify, request, render_template
import mysql.connector

app = Flask(__name__)

registro_calculo = []  # Lista para armazenar os registros selecionados
dicionario_unico = {}
total_carga = 0
tota_fonte = 0
diferenca = [] # usada para atualizar a var local fonte

def conectar_banco():
    return mysql.connector.connect(
        host="127.0.0.1",  # Altere conforme necessário
        user="henry",  # Altere conforme necessário
        password="5563",  # Altere conforme necessário
        database="ENERGIA"  # Nome do seu banco de dados
    )

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/tabelas')
def obter_tabelas():
    conexao = conectar_banco()
    cursor = conexao.cursor()
    cursor.execute("SHOW TABLES")
    #tabelas = [tabela[0] for tabela in cursor.fetchall()]
    tabelas = [t[0] for t in cursor.fetchall()]
    cursor.close()
    conexao.close()
    return jsonify(tabelas)

@app.route('/dados', methods=['GET'])
def dados():
    tabela = request.args.get('tabela', '').upper()  # Captura o parâmetro GET
    if not tabela:
        return jsonify({"erro": "Nenhuma tabela foi informada"}), 400

    dados = consultar_dados_do_banco(tabela)
    return jsonify(dados)

def consultar_dados_do_banco(tabela):
    print(f"RECEBIDO: {tabela}")
    conexao = conectar_banco()
    cursor = conexao.cursor(dictionary=True)

    # Lista de tabelas permitidas (evita SQL Injection)
    tabelas_permitidas = ["GELADEIRA", "BATERIA", "CLIMATIZADOR", "BOMBA_DAGUA","TV"]

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

@app.route('/salvar_registro', methods=['POST'])
def salvar_registro():
    global registro_calculo
    global dicionario_unico, diferenca
    try:
        print(f"Dados brutos recebidos: {request.data}")  # Debug
        dados = request.get_json()  # Obtém os dados enviados pelo JavaScript
        print(f"Dados processados: {dados}")  # Debug

        # Evita duplicatas antes de adicionar
        if dados not in registro_calculo:
            registro_calculo.append(dados)

        # Agrupa registros no dicionário sem sobrescrever
        dicionario_unico = defaultdict(list) # Cria uma lista dentro da registro exe: {k1:[2,1,3], k2:[1]}
        for item in registro_calculo:
            dicionario_unico[item['tabela']].append(item['potencia'])

        print(f"Lista atualizada: {dict(dicionario_unico)}")  # Debug no terminal
        #print(f"Lista atualizada: {dicionario_unico}")
        fonte = list(set(dicionario_unico.keys()))
        print(f"fonte: {fonte}")
        if not diferenca:#for i in fonte:
           #verificar_opcao(i)
           diferenca = fonte 
           a = diferenca[0]
           diferenca.append(a)
           verificar_opcao(a)
           print(f"diferença = {diferenca}")
        else:
            b = list(set(fonte) - set(diferenca))
            a = b[0]
            diferenca.append(a)
            print(f"var a = {a}")
            verificar_opcao(a)
                 

        return jsonify({"mensagem": "Registro salvo com sucesso!", "dados": dados}), 200
    except Exception as e:
        return jsonify({"erro": f"Erro ao processar o registro: {str(e)}"}), 400
    
def verificar_opcao(opcao):
    global total_carga, tota_fonte 
    match opcao:
        case "BATERIA":
            a = dicionario_unico.get("BATERIA",[0])
            tota_fonte += a[0]
            #total_carga -= a[0]
             
        case "PL_SOLAR":
            a = dicionario_unico.get('PL_SOLAR',[0])
            
        case "USINA":
            a = dicionario_unico.get("USINA",[0])
            
        case "AR_CONDICIONADO":
            a = dicionario_unico.get("AR_CONDICIONADO",[0])
            total_carga += a[0]
            
        case "BOMBA_AGUA":
            a = dicionario_unico.get("BOMBA_AGUA",[0])
            total_carga += a[0]
            
        case "INVERSOR":
            a = dicionario_unico.get("INVERSOR",[0])
            total_carga += a[0]
            
        case "CLIMATIZADOR":
            a = dicionario_unico.get("CLIMATIZADOR",[0])
            total_carga += a[0]
            
        case "CONTROLADORA":
            a = dicionario_unico.get("CONTROLADORA",[0])
            
        case "DIVERSOS":
            a = dicionario_unico.get("DIVERSOS",[0])
            for i in a:
                total_carga += a[i]

            print("total + DIVERSOS %d", total_carga)
        case "GELADEIRA":
            a = dicionario_unico.get('GELADEIRA',[None])
            total_carga += a[0]
           
        case "TV":
            a = dicionario_unico.get("TV",[None])
            total_carga += a[0]
           
        case _:
            print("Comando inválido!")
        
    print(f" Fonte = {tota_fonte:.2f}\n Carga = {total_carga:.2f}")
    



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
