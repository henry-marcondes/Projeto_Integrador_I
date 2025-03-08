from flask import Flask, jsonify, request, render_template
import mysql.connector

app = Flask(__name__)

registro_calculo = []  # Lista para armazenar os registros selecionados
 
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
    try:
        dados = request.get_json()  # Obtém os dados enviados pelo JavaScript
        print(f"Dados recebidos: {dados}")  # Debug no terminal

        # Evita duplicatas antes de adicionar
        if dados not in registro_calculo:
            registro_calculo.append(dados)

        # Agrupa registros no dicionário sem sobrescrever
        dicionario_unico = defaultdict(list)
        for item in registro_calculo:
            dicionario_unico[item['tabela']].append(item['potencia'])

        print(f"Lista atualizada: {dict(dicionario_unico)}")  # Debug no terminal

        return jsonify({"mensagem": "Registro salvo com sucesso!", "dados": dados}), 200
    except Exception as e:
        return jsonify({"erro": f"Erro ao processar o registro: {str(e)}"}), 400


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
