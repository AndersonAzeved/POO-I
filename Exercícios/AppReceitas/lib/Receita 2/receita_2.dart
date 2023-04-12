//https://sites.google.com/view/fabricio10/p%C3%A1gina-inicial/cursos/oo-dart/dartreceita2

import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();

  runApp(app);
}

class NewNavBar extends StatelessWidget {
  final List<Icon> objetcs;

  NewNavBar({this.objetcs = const [
              Icon(Icons.coffee_outlined),
              Icon(Icons.local_drink_outlined),]});
  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: botaoFoiTocado,
        items: objetcs
            .map((obj) => BottomNavigationBarItem(icon: obj, label: 'Botão'))
            .toList());
  }
}

class NewBody extends StatelessWidget {
  NewBody();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Expanded(child: Text("La Fin Du Monde - Bock - 65 ibu")),
      Expanded(child: Text("Sapporo Premiume - Sour Ale - 54 ibu")),
      Expanded(child: Text("Duvel - Pilsner - 82 ibu"))
    ]);
  }
}

class NewAppBar extends AppBar {
  NewAppBar({super.title});
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: NewAppBar(title: const Text('Dicas')),
          body: NewBody(),
          bottomNavigationBar: NewNavBar(
            objetcs: const [
              Icon(Icons.coffee_outlined),
              Icon(Icons.local_drink_outlined),
              Icon(Icons.flag_outlined)
            ],
          ),
        ));
  }
}
