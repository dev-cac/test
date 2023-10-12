import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle stlTexto = const TextStyle(fontSize: 23);
  final TextStyle stlCount = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.cyan
  );

  const HomePage({super.key});

  final conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Contador',
              style: stlTexto,
            ),
            Text('$conteo',
              style: stlCount,
            ),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Hola Mundo');
        },
        child: const Icon(Icons.add),
        splashColor: Colors.amber,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }

}
