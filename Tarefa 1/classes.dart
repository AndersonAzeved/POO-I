class Produto {
  double preco;
  String nome;

  Produto({required this.preco, required this.nome});

  void imprimir() {
    print("Produto: $nome\nPreço: $preco");
  }
}

class Item {
  Produto produto;
  double quantidade;

  Item({required this.produto, required this.quantidade});

  //double total() {
  //return this.quantidade * this.produto.preco;
  //}

  double total2() => quantidade * produto.preco;
}

class Venda {
  String data;
  List<Item> itens;

  Venda({required this.data, required this.itens});
  double total() => this.itens.fold(0, (sum, e) => sum + e.total2());
}

void main() {
  Produto produto = Produto(preco: 5, nome: 'Bolo');
  produto.imprimir();
}
