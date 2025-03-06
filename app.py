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

# Página inicial
@app.route('/')
def index():
    return render_template('index.html')

# Retorna as classes de produtos
@app.route('/get_classes_prod', methods=['GET'])
def get_classes_prod():
    try:
        conn = conectar_bd()
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES FROM ENERGI_M")
        tables = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify([t[0] for t in tables])  # Retorna a lista de tabelas
    except Exception as e:
        return jsonify({"erro": str(e)})

# Retorna os produtos de uma classe específica como tabela
@app.route('/get_tabela_produtos', methods=['POST'])
def get_tabela_produtos():
    data = request.json
    classe_selecionada = data.get("classe")

    try:
        conn = conectar_bd()
        cursor = conn.cursor()

        # Obtém as colunas da tabela correspondente
        cursor.execute(f"SHOW COLUMNS FROM {classe_selecionada}")
        colunas = [col[0] for col in cursor.fetchall()]

        # Obtém os produtos dessa classe
        cursor.execute(f"SELECT g.fabricante,g.modelo,g.litros,v.v_12,v.watts,v.amper FROM {classe_selecionada} g INNER JOIN VOLTAGEM v ON g.voltagem = v.id_volt")
        
        produtos = cursor.fetchall()

        cursor.close()
        conn.close()

        return jsonify({"colunas": colunas, "produtos": produtos})

    except Exception as e:
        return jsonify({"erro": str(e)})

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
