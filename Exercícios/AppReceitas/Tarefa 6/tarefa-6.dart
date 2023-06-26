import 'package:flutter/material.dart';

/*
Pesquise sobre formulários em flutter e faça um app 
que exiba uma página com um formulário e diversos itens. 
Use itens de diversos formatos -  campos de texto, radio buttons, 
toggle button, slide etc. Não se preocupe em o formulário "fazer sentido", 
apenas em montá-lo e seja criativo (não quero formulários só com campos de texto). 
Ponha ao menos um botáo nesse formulário. Quando o botão for acionado, o app 
deve exibir apenas um snack bar com uma mensagem indicando que o formulário 
está sendo processado (não precisa submeter o formulário a uma API nem salvá-lo).
Os objetos que compõem o formulário são widgets como pratiamente todos os 
outros objetos que vimos, é apenas uma questão de conhecer os componentes e montá-los. 
*/

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Formulário"),
            centerTitle: true,
          ),
          body: NewBody(),
        ));
  }
}

class NewBody extends StatefulWidget {
  NewBody();

  @override
  _NewBodyState createState() => _NewBodyState();
}

enum Genero { Feminino, Masculino, Outro }

class _NewBodyState extends State<NewBody> {
  Genero genero = Genero.Masculino;
  List<bool> checkBooks = [false, false, false, false, false];
  double _curretRange = 20;

  _NewBodyState();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Container(
            child: Column(
          children: [
            Form(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nome',
                      icon: Icon(Icons.person),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      icon: Icon(Icons.mail),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Container(
                      child: Container(
                        child: Column(children: [
                          Container(
                            height: 10,
                          ),
                          Container(
                            child: Column(children: [
                              Text("Selecione os dias que deseja trabalhar"),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkBooks[0],
                                    onChanged: (check) {
                                      setState(() {
                                        checkBooks[0] = !checkBooks[0];
                                      });
                                    },
                                  ),
                                  Text("Segunda")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkBooks[1],
                                    onChanged: (check) {
                                      setState(() {
                                        checkBooks[1] = !checkBooks[1];
                                      });
                                    },
                                  ),
                                  Text("Terça")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkBooks[2],
                                    onChanged: (check) {
                                      setState(() {
                                        checkBooks[2] = !checkBooks[2];
                                      });
                                    },
                                  ),
                                  Text("Quarta")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkBooks[3],
                                    onChanged: (check) {
                                      setState(() {
                                        checkBooks[3] = !checkBooks[3];
                                      });
                                    },
                                  ),
                                  Text("Quinta")
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: checkBooks[4],
                                    onChanged: (check) {
                                      setState(() {
                                        checkBooks[4] = !checkBooks[4];
                                      });
                                    },
                                  ),
                                  Text("Sexta")
                                ],
                              ),
                            ]),
                          ),
                          Text("Sexo"),
                          Row(
                            children: [
                              Radio(
                                value: Genero.Masculino,
                                groupValue: genero,
                                onChanged: (genero0) {
                                  setState(() {});
                                },
                              ),
                              Text("Masculino"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: Genero.Feminino,
                                groupValue: Genero.Feminino,
                                onChanged: (genero1) {
                                  setState(() {});
                                },
                              ),
                              Text("Feminino"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: Genero.Outro,
                                groupValue: Genero.Outro,
                                onChanged: (select) {
                                  setState(() {});
                                },
                              ),
                              Text("Outro"),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 120),
                    child: ElevatedButton.icon(
                      label: Text('Enviar'),
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Enviado com Sucesso!'),
                          action: SnackBarAction(
                            label: 'Voltar',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                  ),
                ],
              ),
            )),
          ],
        )),
      ),
    ));
  }
}
