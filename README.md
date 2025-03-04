A função:

@app.route('/get_classes_prod', methods=['GET'])
def get_classes_prod():
    return jsonify(list(classes_produtos.keys()))

O que ela faz: 
1. Define uma rota Flask

2. A URL /get_classes_prod é acessível via o 
   método HTTP GET.
  * A variável classes_produtos é um dicionário onde 
    as chaves representam diferentes categorias de produtos (como "Ar-Condicionado", "Climatizador", etc.).
  * classes_produtos.keys() retorna apenas os nomes das
    categorias.
  * list(classes_produtos.keys()) converte as chaves do
    dicionário em uma lista.

3. Formata a resposta em JSON
   * jsonify(...) transforma essa lista em uma resposta
     JSON, para que o frontend possa consumir
     facilmente.

4. Exemplo de Resposta JSON
   Se classes_produtos for:

{
    "Ar-Condicionado": ["Split 9000 BTU", "Split 12000 BTU"],
    "Climatizador": ["Climatizador Portátil", "Climatizador Industrial"],
    "Bomba d'Água": ["Bomba Centrífuga", "Bomba Submersa"]
}

Então, acessar /get_classes_prod retornará:

["Ar-Condicionado", "Climatizador", "Bomba d'Água"]
Para que serve?
Essa rota é usada pelo frontend para preencher dinamicamente o <select> de "Classe do Produto" na interface HTML.

