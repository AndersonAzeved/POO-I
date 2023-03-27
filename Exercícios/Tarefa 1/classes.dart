class Produto {
  double preco;
  String nome;

  Produto({required this.preco, required this.nome});

  void imprimirProduto() {
    print("---------------------");
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
  void imprimirItem() {
    print("Quantidade: $quantidade");
    print("Total: ${total2()}");
    print("---------------------\n");
  }
}

class Venda {
  String data;

  List<Item> itens;

  Venda({required this.data, required this.itens});
  double total() => this.itens.fold(0, (sum, e) => sum + e.total2());

  void imprimirVenda() {
    print("Data: $data\nTotal da Compra: ${total()}");
    print("---------------------\n");
  }
}

void main() {
  Produto produto1 = Produto(preco: 5, nome: 'Bolo');
  Produto produto2 = Produto(preco: 1, nome: 'Paçoca');
  Item item1 = Item(produto: produto1, quantidade: 5);
  Item item2 = Item(produto: produto2, quantidade: 3);
  Venda venda = Venda(data: "13/03/2023", itens: [item1, item2]);
  produto1.imprimirProduto();
  item1.imprimirItem();
  produto2.imprimirProduto();
  item2.imprimirItem();
  venda.imprimirVenda();
}
