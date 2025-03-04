import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)
#@app.route("/")

# Configuração do banco de dados
def conectar_bd():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="henry",
        password="5563",
        database="ENERGI_M"
    )
# Função para conectar ao banco
#def get_db_connection():
#    return mysql.connector.connect(**db_config)

@app.route('/test_db')
def test_db():
    try:
        conn = conectar_bd()
        cursor = conn.cursor()
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify({"tables": [table[0] for table in tables]})  # Retorna uma lista de tabelas em JSON
    except Exception as e:
        return jsonify({"error": str(e)})  # Retorna o erro em JSON

    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

