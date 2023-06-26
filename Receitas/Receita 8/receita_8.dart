import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://blog.flutterando.com.br/utilizando-o-url-launcher-no-flutter-com-exemplos-bdc54acaddbc

/*
1 OK
2 OK
3 OK
4 OK
5 OK
6 OK
7 https://www.kindacode.com/article/flutter-datatable/ 
  https://stackoverflow.com/questions/67734560/filter-data-in-datatable-flutter
8 
*/


enum TableStatus{idle,loading,ready,error}
class DataService  {
  final ValueNotifier<Map<String,dynamic>> tableStateNotifier = new ValueNotifier({
                              'status':TableStatus.idle,
                              'dataObjects':[]
                            });

  void carregar(index) {
    var size = opSelect.toString();
    final funcoes = [carregarCafes, carregarCervejas, carregarNacoes, carregarSobremesas];
    tableStateNotifier.value = {
      'status': TableStatus.loading,
      'dataObjects': []
    };
    

    funcoes[index](size);
  }

  void carregarCafes(size) {
    var coffeeUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/coffee/random_coffee',
      queryParameters: {'size': size}
    );

    http.read(coffeeUri).then((jsonString){
      var coffeeJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': coffeeJson,
        'propertyNames': ["blend_name", "origin", "variety"],
        'columnNames' : ['Nome', 'Origem', 'Variedade']
      };

      tableStateNotifier.value = coffeeJson;
    }).catchError( (err, stackTrace){
      if(err.toString() == "XMLHttpRequest error."){
        tableStateNotifier.value = {
        'status': TableStatus.error,
        };
      }
    });
  }

  void carregarNacoes(size) {
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': size}
    );

    http.read(nationsUri).then((jsonString){
      var nationsJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': nationsJson,
        'propertyNames': ['nationality', 'language', 'capital'],
        'columnNames' : ['Nacionalidade', 'Lingua', 'Capital']
      };

      tableStateNotifier.value = nationsJson;
    }).catchError( (err, stackTrace){
      if(err.toString() == "XMLHttpRequest error."){
        tableStateNotifier.value = {
        'status': TableStatus.error,
        };
      }
    });
  }
  
  /*
  Future<void> carregarNacoes() async{
    var nationsUri = Uri(
      scheme: 'https',
      host: 'random-data-api.com',
      path: 'api/nation/random_nation',
      queryParameters: {'size': '5'}
    );

    var jsonString = await http.read(nationsUri);
    var nationsJson = jsonDecode(jsonString);
    
    tableStateNotifier.value = nationsJson;
    }
  }*/

  void carregarCervejas(size) {
    var beersUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/beer/random_beer',
        queryParameters: {'size': size});

    http.read(beersUri).then((jsonString) {
      var beersJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': beersJson,
        'propertyNames': ["name","style","ibu"],
        'columnNames' : ["Nome", "Estilo", "IBU"]
      };
      

      tableStateNotifier.value = beersJson;
    }).catchError( (err, stackTrace){
      if(err.toString() == "XMLHttpRequest error."){
        tableStateNotifier.value = {
        'status': TableStatus.error,
        };
      }
    });
  }

    void carregarSobremesas(size) {
    var foodUri = Uri(
        scheme: 'https',
        host: 'random-data-api.com',
        path: 'api/dessert/random_dessert',
        queryParameters: {'size': size});

    http.read(foodUri).then((jsonString) {
      var foodJson = jsonDecode(jsonString);
      tableStateNotifier.value = {
        'status': TableStatus.ready,
        'dataObjects': foodJson,
        'propertyNames': ["variety",'topping', "flavor"],
        'columnNames' : ["Variedade", 'Cobertura', "Sabor"]
      };

      tableStateNotifier.value = foodJson;
    }).catchError( (err, stackTrace){
      if(err.toString() == "XMLHttpRequest error."){
        tableStateNotifier.value = {
        'status': TableStatus.error,
        };
      }
    });
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
                switch (value['status']) {
                  case TableStatus.idle:
                    return Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Seja bem-vindo ao aplicativo Dicas', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 5)),
                            Text('Para iniciar sua experiência, selecione algum botão na parte inferior', style: TextStyle(fontSize: 15, height: 2)),
                            Text('Instruções de uso', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, height: 5)),
                            Text(' O aplicativo possue três botões, Cafés, Cervejas e Nações, cada um fornece cinco informações:\n'
                            '1.Cafés: Nome, Origem e Variedade\n'
                            '2.Cervejas: Nome, Estilo e IBU\n'
                            '3.Nações: Nacionalidade, Lingua e Capital\n'
                            '4.Sobremesas: Variedade, Cobertura, Sabor'
                            , style: TextStyle(fontSize: 15,)),
                          ],
                        ),
                      ),
                    );

                  case TableStatus.loading:
                    return Center(child: CircularProgressIndicator());

                  case TableStatus.ready:
                    return Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            MyRadiusButton(),
                            DataTableWidget(
                                jsonObjects: value['dataObjects'],
                                propertyNames: value['propertyNames'],
                                columnNames: value['columnNames'])])));
                  case TableStatus.error:
                    return Center(
                      child: Column(
                        children: [
                          Text('ERROR!\nSem internet', style: TextStyle(color: Colors.deepPurple, fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Image.asset('assets/sem_net.png')
                        ],
                      )
                    );
                }

                return Text("Sem internt");
              }),
          bottomNavigationBar:
              NewNavBar(itemSelectedCallback: dataService.carregar),
        ));
  }
}


class NewNavBar extends HookWidget {
  final _itemSelectedCallback;

  NewNavBar({itemSelectedCallback})
      : _itemSelectedCallback = itemSelectedCallback ?? (int) {}

  @override
  Widget build(BuildContext context) {
    var state = useState(1);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        onTap: (index) {
          state.value = index;

          _itemSelectedCallback(index);
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.deepPurple,
        currentIndex: state.value,
        items: const [
          BottomNavigationBarItem(
            label: "Cafés",
            icon: Icon(Icons.coffee_outlined),
          ),
          BottomNavigationBarItem(
              label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
          BottomNavigationBarItem(
              label: "Nações", icon: Icon(Icons.flag_outlined)),
          BottomNavigationBarItem(
            label: 'Sobremesas', icon: Icon(Icons.icecream)
          )
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

enum QuantList {
  CINCO(5,'5'), DEZ(10, '10'), QUINZE(15,'15');
  
  final int id;
  final String value;
  const QuantList(this.id, this.value);
}

class MyRadiusButton extends StatefulWidget{
  MyRadiusButton();

  @override 
  My createState() => My();

}

var opSelect = 5;

class My extends State<MyRadiusButton>{
  QuantList? opcao = QuantList.CINCO;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple[200],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Quantidade de itens", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Text('5'),
                  Radio(
                    value: QuantList.CINCO,
                    groupValue: opcao,
                    onChanged: (QuantList? id) {
                      setState(() {
                        opcao = QuantList.CINCO;
                        opSelect = QuantList.CINCO.id;
                      });
                    },
                  ),
                ],
              ),

              Row(
                children: [
                  Text('10'),
                  Radio(
                    value: QuantList.DEZ,
                    groupValue: opcao,
                    onChanged: (QuantList? id) {
                      setState(() {
                        opcao = QuantList.DEZ;
                        opSelect = QuantList.DEZ.id;
                      });
                    },
                  ),
                ],
              ),
              
              Row(
                children: [
                  Text('15'),
                  Radio(
                    value: QuantList.QUINZE,
                    groupValue: opcao,
                    onChanged: (QuantList? id) {
                      setState(() {
                        opcao = QuantList.QUINZE;
                        opSelect = QuantList.QUINZE.id;
                      });
                    },
                  ),
                ],
              ),
              
            ],
          )
            ]
          )
        )
      );
  }

}
