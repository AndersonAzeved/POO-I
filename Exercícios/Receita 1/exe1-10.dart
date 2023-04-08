import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        fontFamily: 'Fantasy',
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 223, 178, 180),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("The Beers"),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const Text('\nCatálogo',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            const Text(
                '\nA cerveja é uma bebida produzida a partir da fermentação de cereais, principalmente a cevada maltada.  Acredita-se que tenha sido uma das primeiras bebidas alcoólicas que foram criadas pelo ser humano. Atualmente, é a terceira bebida mais popular do mundo, logo depois da água e do café.',
                style: TextStyle(
                  fontSize: 10.0,
                )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  onLongPress: () {},
                  icon: const Icon(
                      Icons.sports_bar), //icon data for elevated button
                  label: const Text("Cervejar"), //label text
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  onLongPress: () {},
                  icon: const Icon(Icons.info), //icon data for elevated button
                  label: const Text("Informação"), //label text
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  onLongPress: () {},
                  icon:
                      const Icon(Icons.logout), //icon data for elevated button
                  label: const Text("Sair"), //label text
                ),
              ],
            )),
          ]),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ], onTap: (int indexOfItem) {}),
      ));
  runApp(app);
}
