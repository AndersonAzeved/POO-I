import 'package:flutter/material.dart';

var dataObjects = [
  {"name": "La Fin Du Monde", "style": "Bock", "ibu": "65"},
  {"name": "Sapporo Premiume", "style": "Sour Ale", "ibu": "54"},
  {"name": "Duvel", "style": "Pilsner", "ibu": "82"},
  {"name": "IPA Dogma", "style": "American IPA", "ibu": "70"},
  {"name": "Weihenstephaner Hefeweissbier", "style": "Hefeweizen", "ibu": "14"},
  {"name": "Guinness Draught", "style": "Irish Dry Stout", "ibu": "45"},
  {"name": "Chimay Blue", "style": "Belgian Strong Dark Ale", "ibu": "35"},
  {"name": "Sierra Nevada Pale Ale", "style": "American Pale Ale", "ibu": "38"},
  {"name": "Hoegaarden Witbier", "style": "Belgian Witbier", "ibu": "15"},
  {"name": "Brooklyn Lager", "style": "American Amber Lager", "ibu": "33"},
  {"name": "Paulaner Salvator", "style": "Doppelbock", "ibu": "25"},
  {"name": "Fuller's London Pride", "style": "English Pale Ale", "ibu": "30"},
  {"name": "Rochefort 10", "style": "Quadrupel", "ibu": "35"},
  {"name": "Duvel", "style": "Belgian Strong Golden Ale", "ibu": "32"},
  {"name": "Anchor Steam Beer", "style": "California Common", "ibu": "37"},
  {"name": "Pilsner Urquell", "style": "Czech Pilsner", "ibu": "40"},
  {"name": "La Chouffe", "style": "Belgian Strong Pale Ale", "ibu": "20"},
  {"name": "Stone IPA", "style": "American IPA", "ibu": "77"}
];

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

          //body: DataBodyWidget(objects: dataObjects),
          body: MytileWidget(
            objects: dataObjects,
          ),
          bottomNavigationBar: NewNavBar(),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  NewNavBar();

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: botaoFoiTocado, items: const [
      BottomNavigationBarItem(
        label: "Cafés",
        icon: Icon(Icons.coffee_outlined),
      ),
      BottomNavigationBarItem(
          label: "Cervejas", icon: Icon(Icons.local_drink_outlined)),
      BottomNavigationBarItem(label: "Nações", icon: Icon(Icons.flag_outlined))
    ]);
  }
}

class DataBodyWidget extends StatelessWidget {
  final List objects;

  DataBodyWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];

    return Scrollbar(
        child: SingleChildScrollView(
      child: DataTable(
          columns: columnNames
              .map((name) => DataColumn(
                  label: Expanded(
                      child: Text(name,
                          style: TextStyle(fontStyle: FontStyle.italic)))))
              .toList(),
          rows: objects
              .map((obj) => DataRow(
                  cells: propertyNames
                      .map((propName) => DataCell(Text(obj[propName])))
                      .toList()))
              .toList()),
    ));
  }
}

class MytileWidget extends StatelessWidget {
  final List objects;

  MytileWidget({this.objects = const []});

  @override
  Widget build(BuildContext context) {
    var columnNames = ["Nome", "Estilo", "IBU"],
        propertyNames = ["name", "style", "ibu"];

    return ListView(
      children: objects
          .map((obj) => ListTile(
              onTap: () {},
              leading: Text(obj['name']),
              title: Text(obj['style']),
              trailing: Text(obj['ibu'])))
          .toList(),
    );
  }
}
