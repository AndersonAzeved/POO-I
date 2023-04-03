import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
        appBar: AppBar(title: const Text("Memes Blog")),
        body: Center(
            child: Column(children: [
          Text("\nÚltimas Notícias\n",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40)),
          Text(
              "Jovem do meme 'Já acabou, Jéssica?' entrou em depressão e abandonou escola após repercussão do vídeo",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )),
          Text(
              "\nLara da Silva, uma das jovens por trás do meme 'Já acabou, Jéssica?, revelou ter sofrido com depressão após a repercussão do viral. A frase, que ganhou a internet em 2015, foi dita por ela durante uma briga na saída da escola, quando tinha 12 anos."),
          ElevatedButton(
            onPressed: null,
            child: const Text('Botão 1'),
          ),
          ElevatedButton(
            onPressed: null,
            child: const Text('Botão 2'),
          ),
          ElevatedButton(
            onPressed: null,
            child: const Text('Botão 3'),
          ),
        ])),
        /*
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
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
        ],
      ),*/
      ));

  runApp(app);
}
