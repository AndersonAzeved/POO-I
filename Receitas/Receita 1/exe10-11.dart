import 'package:flutter/material.dart';

void main() {
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        fontFamily: 'Fantasy',
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 250, 247),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cervejas"),
        ),
        body: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Nome',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Estilo',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'IBU',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('La Fin Du Monde')),
                        DataCell(Text('Bock')),
                        DataCell(Text('65')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Sapporo Premium')),
                        DataCell(Text('Sour Ale')),
                        DataCell(Text('54')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Duvel')),
                        DataCell(Text('Pilsner ')),
                        DataCell(Text('82')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Altbier')),
                        DataCell(Text('Altbier')),
                        DataCell(Text('25')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Kellerbier	')),
                        DataCell(Text('Amber Kellerbier	')),
                        DataCell(Text('30')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Amber')),
                        DataCell(Text('American Amber Ale')),
                        DataCell(Text('25')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Seasonal Beer')),
                        DataCell(Text('Autumn Seasonal Beer')),
                        DataCell(Text('5')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Belgian Blond')),
                        DataCell(Text('Belgian Blond Ale')),
                        DataCell(Text('15')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Weisse')),
                        DataCell(Text('Berliner Weisse')),
                        DataCell(Text('3')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Brown')),
                        DataCell(Text('Brown IPA')),
                        DataCell(Text('40')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Catharina')),
                        DataCell(Text('Catharina Sour')),
                        DataCell(Text('2')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Eisbock')),
                        DataCell(Text('Eisbock')),
                        DataCell(Text('25')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Fruit Beer')),
                        DataCell(Text('Fruit Beer')),
                        DataCell(Text('5')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('Amber')),
                        DataCell(Text('International Amber Lager')),
                        DataCell(Text('8')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Kölsch')),
                        DataCell(Text('Kölsch')),
                        DataCell(Text('18')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.grey),
                      cells: <DataCell>[
                        DataCell(Text('New England')),
                        DataCell(Text('New England IPA')),
                        DataCell(Text('25')),
                      ],
                    ),
                    DataRow(
                      color: MaterialStatePropertyAll(Colors.blueGrey),
                      cells: <DataCell>[
                        DataCell(Text('Old')),
                        DataCell(Text('Old Ale')),
                        DataCell(Text('30')),
                      ],
                    ),
                  ],
                ),
              ),
            )),
        //BottomNavigation
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_bar_outlined),
            label: 'Cervejas',
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
