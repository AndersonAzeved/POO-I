import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class DataService {
  final ValueNotifier<List> tableStateNotifier = new ValueNotifier([]);

  List<String> columnsNames = [''];
  List<String> propertyNames = [''];

  void carregar(index) {
    //Usando sem if
    //index == 0 ? carregarCafes() : null;
    //index == 1 ? carregarCervejas() : null;
    //index == 2 ? carregarNacoes() : null;

    if (index == 0) {
      // Cafés
      columnsNames = ['Nome', 'Categoria', 'Preço'];
      propertyNames = ['name', 'category', 'price'];
      carregarCafes();
    } else if (index == 1) {
      // Cervejas
      columnsNames = ['Nome', 'Estilo', 'Ibu'];
      propertyNames = ['name', 'style', 'ibu'];
      carregarCervejas();
    } else if (index == 2) {
      // Nações
      columnsNames = ['Nome', 'Continente', 'Sigla'];
      propertyNames = ['name', 'continent', 'abbreviation'];
      carregarNacoes();
    }
  }

  void carregarCervejas() {
    tableStateNotifier.value = [
      {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
      {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
      {"name": "Duvel", "style": "Pilsner", "ibu": "82"}
    ];
  }

  void carregarCafes() {
    tableStateNotifier.value = [
      {
        "name": "Fazenda Primavera",
        "category": "Café arábica",
        "price": "25,00"
      },
      {"name": "Café do Moço", "category": "Café arábica", "price": "28,00"},
      {"name": "Sul de Minas", "category": "Café arábica", "price": "20,00"},
      {"name": "Santa Monica", "category": "Café arábica", "price": "32,00"},
      {
        "name": "Orfeu Cafés Especiais",
        "category": "Café arábica",
        "price": "40,00"
      }
    ];
  }

  void carregarNacoes() {
    tableStateNotifier.value = [
      {"name": "Brasil", "continent": "América do Sul", "abbreviation": "BR"},
      {
        "name": "Estados Unidos",
        "continent": "América do Norte",
        "abbreviation": "US"
      },
      {"name": "China", "continent": "Ásia", "abbreviation": "CN"},
      {"name": "Austrália", "continent": "Oceania", "abbreviation": "AU"},
      {"name": "Alemanha", "continent": "Europa", "abbreviation": "DE"}
    ];
  }
}

final dataService = DataService();

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Dicas"),
          ),
          body: ValueListenableBuilder(
              valueListenable: dataService.tableStateNotifier,
              builder: (_, value, __) {
                return DataTableWidget(
                    jsonObjects: value,
                    propertyNames: dataService.propertyNames,
                    columnNames: dataService.columnsNames);
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}

class NewNavBar extends HookWidget {
  var itemSelectedCallback; //esse atributo será uma função

  NewNavBar({this.itemSelectedCallback}) {
    itemSelectedCallback ??= (_) {};
  }

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
        onTap: (index) {
          state.value = index;
          itemSelectedCallback(index);
        },
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined))
        ]);
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  final List<String> columnNames;

  final List<String> propertyNames;

  DataTableWidget(
      {this.jsonObjects = const [],
      this.columnNames = const ["Nome", "Estilo", "IBU"],
      this.propertyNames = const ["name", "style", "ibu"]});

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: columnNames
            .map((name) => DataColumn(
                label: Expanded(
                    child: Text(name,
                        style: TextStyle(fontStyle: FontStyle.italic)))))
            .toList(),
        rows: jsonObjects
            .map((obj) => DataRow(
                cells: propertyNames
                    .map((propName) => DataCell(Text(obj[propName])))
                    .toList()))
            .toList());
  }
}
