import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> opciones = const ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes XD'),
      ),
      body: ListView(
        children: _createItemsSmall()
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> lista = [];

    for (String opt in opciones) {
      final tmpWidget = ListTile(
        title: Text(opt),
      );

      lista
        ..add(tmpWidget)
        ..add(const Divider());
    }

    return lista;
  }

  List<Widget> _createItemsSmall() {
    return opciones.map((item) {

      return Column(
        children: [
          ListTile(
            title: Text('$item!'),
            subtitle: Text('info to $item'),
            leading: const Icon(Icons.zoom_in_map),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          const Divider()
        ],
      );

    }).toList();
  }
}
