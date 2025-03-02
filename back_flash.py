from flask import Flask, request, jsonify
import mysql.connector

back_flash = Flask(__name__)

@back_flash.route("/")
def home():
    return open("index.html").read()  # Certifique-se de que "index.html" está na mesma pasta do seu script Flask.


# Conexão com o MySQL
# meu ip "172.23.43.51" 
def conectar_bd():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="henry",
        password="5563",
        database="ENERGI_M"
    )

# Função para calcular consumo da bateria
def calcular_bateria(itens):
    consumo_total = 0
    conexao = conectar_bd()
    cursor = conexao.cursor(dictionary=True)

    for item in itens:
        if int(itens[item]) > 0:
            cursor.execute("SELECT watts FROM VOLTAGEM WHERE id_prod = %s", (itens[item],))
            resultado = cursor.fetchone()
            if resultado:
                consumo_total += resultado["watts"]

    cursor.close()
    conexao.close()

    # Simulação do consumo ao longo do tempo
    tempo = list(range(0, 24))  # Simula 24 horas
    amperagem = [consumo_total / (12 if 12 in itens.values() else 24) for _ in tempo]

    return tempo, amperagem

@back_flash.route("/calcular", methods=["POST"])
def calcular():
    itens_selecionados = request.form.to_dict()
    tempo, amperagem = calcular_bateria(itens_selecionados)

    return jsonify({"tempo": tempo, "amperagem": amperagem})

if __name__ == "__main__":
    back_flash.run(host="0.0.0.0", port=5000, debug=True)

