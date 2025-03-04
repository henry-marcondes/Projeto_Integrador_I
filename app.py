from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

# Opções das classes de produtos e seus respectivos produtos
classes_produtos = {
    "Ar-Condicionado": ["Split 9000 BTU", "Split 12000 BTU", "Janela 7500 BTU"],
    "Climatizador": ["Climatizador Portátil", "Climatizador Industrial"],
    "Bomba d'Água": ["Bomba Centrífuga", "Bomba Submersa", "Bomba Periférica"],
    "Geladeira": ["26L","30L","40L","45L","50L","60L"]
}

# Estado inicial da carga da bateria

bateria_carga = 100  # Começa em 100%

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/get_classes_prod', methods=['GET'])
def get_classes_prod():
    return jsonify(list(classes_produtos.keys()))

@app.route('/get_produtos', methods=['POST'])
def get_produtos():
    data = request.json
    classe_selecionada = data.get("classe")
    produtos = classes_produtos.get(classe_selecionada, [])
    return jsonify(produtos)

@app.route('/get_bateria', methods=['GET'])
def get_bateria():
    global bateria_carga
    return jsonify({"carga": bateria_carga})

@app.route('/set_bateria', methods=['POST'])
def set_bateria():
    global bateria_carga
    data = request.json
    bateria_carga = max(0, min(100, data.get("carga", bateria_carga)))  # Mantém entre 0 e 100%
    return jsonify({"status": "ok", "carga": bateria_carga})

if __name__ == '__main__':
     app.run(host="0.0.0.0", port=5000, debug=True)

