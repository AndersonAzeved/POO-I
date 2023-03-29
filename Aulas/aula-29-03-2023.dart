//https://api.flutter.dev/flutter/material/material-library.html

/*
 * flutter style text: https://medium.com/flutter-community/beginners-guide-to-text-styling-in-flutter-3939085d6607
 * flutter row example
 * flutter elevated button
 * flutter icon button
*/

import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Scaffold(
          appBar: AppBar(title: Text("Globo News")),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Text("\n"
                "Lara da Silva, uma das jovens por trás do meme 'Já acabou, Jéssica?, revelou ter sofrido com depressão após a repercussão do viral."
                "A frase, que ganhou a internet em 2015, foi dita por ela durante uma briga na saída da escola, quando tinha 12 anos. "
                "")
          ])),
          bottomNavigationBar: Text("WhatsApp")));
  runApp(app);
}
