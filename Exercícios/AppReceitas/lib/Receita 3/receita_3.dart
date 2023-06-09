import 'package:flutter/material.dart';

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
          appBar: NewAppBar(
            titulo: 'Dicas',
            objects: const ['Verde', 'Azul', 'Cinza'],
          ),
          body: DataBodyWidget(objects: const [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu"
          ]),
          bottomNavigationBar: NewNavBar(
            objects: const [
              Icon(Icons.coffee_outlined),
              Icon(Icons.local_drink_outlined),
              Icon(Icons.flag_outlined)
            ],
          ),
        ));
  }
}

class NewAppBar extends AppBar {
  final List<String> objects;
  final String titulo;

  NewAppBar(
      {this.titulo = "Title", this.objects = const ['Cor 1', 'Cor 2', 'Cor 3']})
      : super(title: Text(titulo), leading: const Icon(Icons.home), actions: [
          PopupMenuButton(
            itemBuilder: (context) => objects
                .map((obj) => PopupMenuItem<int>(
                    value: objects.indexOf(obj), child: Text(obj)))
                .toList(),
          )
        ]);
}

class NewNavBar extends StatelessWidget {
  final List<Icon> objects;

  NewNavBar(
      {this.objects = const [
        Icon(Icons.coffee_outlined),
        Icon(Icons.local_drink_outlined),
      ]});

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: botaoFoiTocado,
        items: objects
            .map((obj) => BottomNavigationBarItem(icon: obj, label: 'Botão'))
            .toList());
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({this.objects = const []});

  Expanded processarUmElemento(String obj) {
    return Expanded(
      child: Center(child: Text(obj)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: objects
            .map((obj) => Expanded(
                  child: Center(child: Text(obj)),
                ))
            .toList());
  }
}
