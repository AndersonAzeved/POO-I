import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("The Beers"),
        ),
        body: const Center(
          child: Column(children: [
            Text('\nCatálogo',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            Text(
                '\nA cerveja é uma bebida produzida a partir da fermentação de cereais, principalmente a cevada maltada.  Acredita-se que tenha sido uma das primeiras bebidas alcoólicas que foram criadas pelo ser humano. Atualmente, é a terceira bebida mais popular do mundo, logo depois da água e do café.',
                style: TextStyle(
                  fontSize: 10.0,
                )),
          ]),
        ),
        bottomNavigationBar: const Text("Botão 1"),
      ));
  runApp(app);
}
