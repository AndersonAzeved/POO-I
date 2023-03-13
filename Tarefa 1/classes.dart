class Produto {
  double preco;
  String nome;

  Produto({required this.preco, required this.nome});

  void imprimir() {
    print("Produto: $nome\nPreço: $preco");
  }
}

class Item {
  int quantidade;

  Item({required this.quantidade});
}

void main() {
  Produto produto1 = Produto(preco: 5, nome: 'Bolo');
  produto1.imprimir();
}
