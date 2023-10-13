import 'package:components/src/utils/icon_util.dart';
import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  final List<String> opciones = const ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data) {
    final List<Widget> opciones = [];

    data?.forEach((elm) {
      final widgetTmp = ListTile(
        title: Text(elm['texto']),
        leading: getIcon(elm['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {}
      );

      opciones
        ..add(widgetTmp)
        ..add(const Divider());
    });

    return opciones;
  }
}
