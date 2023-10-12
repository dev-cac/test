import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }

}

class _CounterPageState extends State<CounterPage> {
  final TextStyle _stlTexto = const TextStyle(fontSize: 23);
  final TextStyle _stlCount = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.cyan
  );

  var _conteo = 0;

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
              style: _stlTexto,
            ),
            Text('$_conteo',
              style: _stlCount,
            ),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: _createButtons()
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30),
        FloatingActionButton(
            onPressed: () {
              setState(() {
                _conteo = 0;
              });
            },
            child: const Icon(Icons.exposure_zero),
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            onPressed: () {
              setState(() {
                _conteo--;
              });
            },
            child: const Icon(Icons.remove),
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
        ),
        SizedBox(width: 10),
        FloatingActionButton(
            onPressed: () {
              setState(() {
                _conteo++;
              });
            },
            child: const Icon(Icons.add),
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
        )
      ],
    );
  }
}
