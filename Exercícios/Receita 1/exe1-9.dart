import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        fontFamily: 'Fantasy',
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 178, 180),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("The Beers"),
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('\nCatálogo',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                    '\nA cerveja é uma bebida produzida a partir da fermentação de cereais, principalmente a cevada maltada.  Acredita-se que tenha sido uma das primeiras bebidas alcoólicas que foram criadas pelo ser humano. Atualmente, é a terceira bebida mais popular do mundo, logo depois da água e do café.\n',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),

          //Imagens
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50.0,
                  width: 120.0,
                  child: Column(children: [
                    const ListTile(
                      title: Text('Budweiser'),
                      tileColor: Colors.red,
                    ),
                    FadeInImage.assetNetwork(
                        fadeInDuration: const Duration(seconds: 2),
                        placeholder: 'assets/images/loading.gif',
                        image:
                            'https://imgs.casasbahia.com.br/55017372/1g.jpg?imwidth=500'),
                  ]),
                ),
                SizedBox(
                  height: 50.0,
                  width: 120.0,
                  child: Column(children: [
                    const ListTile(
                      title: Text('Spaten'),
                      tileColor: Colors.red,
                    ),
                    FadeInImage.assetNetwork(
                        fadeInDuration: const Duration(seconds: 2),
                        placeholder: 'assets/images/loading.gif',
                        image:
                            'https://imgs.casasbahia.com.br/1554019029/1xg.jpg?imwidth=500'),
                  ]),
                ),
                SizedBox(
                  height: 50.0,
                  width: 120.0,
                  child: Column(children: [
                    const ListTile(
                      title: Text('Corona'),
                      tileColor: Colors.red,
                    ),
                    FadeInImage.assetNetwork(
                        fadeInDuration: const Duration(seconds: 2),
                        placeholder: 'assets/images/loading.gif',
                        image:
                            'https://imgs.casasbahia.com.br/1508765371/1xg.jpg'),
                  ]),
                ),
              ],
            ),
          ),

          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
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
                    icon:
                        const Icon(Icons.info), //icon data for elevated button
                    label: const Text("Informação"), //label text
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    onLongPress: () {},
                    icon: const Icon(
                        Icons.logout), //icon data for elevated button
                    label: const Text("Sair"), //label text
                  ),
                ],
              ),
            ],
          )),
        ]),

        //BottomNavigation
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
