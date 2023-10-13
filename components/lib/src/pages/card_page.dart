import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          _cardType1(),
          const SizedBox(height: 30),
          _cardType2(),
        ],
      )
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Esta es una buena descripción de ejemplo para poder ver la información de la tarjeta xd'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {}
              ),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {}
              )
            ]
          )
        ]
      ),
    );
  }

  Widget _cardType2() {
    return Card(
      child: Column(
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 230,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text('Otro texto de prueba bien raro xd'),
          )
        ],
      ),
    );
  }
}
