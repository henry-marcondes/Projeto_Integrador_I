from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# Configuração do banco de dados
def conectar_bd():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="henry",
        password="5563",
        database="ENERGI_M"
    )

# Lista para armazenar as classes de produtos
classe_produtos = []

# Função para buscar os dados do banco de dados
def carregar_classes_produtos():
    global classe_produtos  # Permite modificar a variável global
    try:
        conn = conectar_bd()
        cursor = conn.cursor()
        cursor.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'ENERGI_M' AND TABLE_NAME = 'Classe_PROD' AND COLUMN_NAME NOT IN ('id_clss', 'clss_prd');")
        tables = cursor.fetchall()
        cursor.close()
        conn.close()

        # Limpa a lista antes de adicionar novos itens
        classe_produtos.clear()
        for table in tables:
            classe_produtos.append(table[0])  # Extrai apenas o nome da coluna

        print("Classes de produtos carregadas:", classe_produtos)  # Verifica a saída no terminal
    except Exception as e:
        print("Erro ao carregar classes de produtos:", str(e))

# Chama a função para carregar os dados ao iniciar
carregar_classes_produtos()

def carregar_atributos(x):
    #global classe  # Permite modificar a variável global
    try:
        conn = conectar_bd()
        cursor = conn.cursor()
        cursor.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'ENERGI_M' AND TABLE_NAME = 'Classe_PROD' AND COLUMN_NAME NOT IN ('id_clss', 'clss_prd');")
        tables = cursor.fetchall()
        cursor.close()
        conn.close()
        print("Produtos carregado:", classe_produtos)  # Verifica a saída no terminal
    except Exception as e:
        print("Erro ao carregar classes de produtos:", str(e))

# Rota para testar a conexão com o banco
@app.route('/test_db')
def test_db():
    return jsonify({"tables": classe_produtos})

# Página inicial
@app.route('/')
def index():
    return render_template('index.html')

# Retorna as classes de produtos
@app.route('/get_classes_prod', methods=['GET'])
def get_classes_prod():
    return jsonify(classe_produtos)

# Retorna os produtos de uma classe específica (A ser implementado corretamente)
@app.route('/get_produtos', methods=['POST'])
def get_produtos():
    global classe_selecionada 
    data = request.json
    classe_selecionada = data.get("classe")
    print("Classe selecionada:", classe_selecionada)  # Exibe no terminal
    return jsonify({"produtos": []})  # Retorna uma lista vazia até ser implementado

# Estado inicial da carga da bateria
bateria_carga = 100

@app.route('/get_bateria', methods=['GET'])
def get_bateria():
    return jsonify({"carga": bateria_carga})

@app.route('/set_bateria', methods=['POST'])
def set_bateria():
    global bateria_carga
    data = request.json
    bateria_carga = max(0, min(100, data.get("carga", bateria_carga)))
    return jsonify({"status": "ok", "carga": bateria_carga})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
