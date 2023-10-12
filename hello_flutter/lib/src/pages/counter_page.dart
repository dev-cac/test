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
        const SizedBox(width: 30),
        FloatingActionButton(
            onPressed: _reset,
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.exposure_zero),
        ),
        const Expanded(child: SizedBox()),
        FloatingActionButton(
            onPressed: _restar,
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
            onPressed: _agregar,
            splashColor: Colors.amber,
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.add),
        )
      ],
    );
  }

  _agregar() {
    _conteo++;
    setState(() {});
  }

  _restar() {
    _conteo--;
    setState(() {});
  }

  _reset() {
    _conteo = 0;
    setState(() {});
  }
}
