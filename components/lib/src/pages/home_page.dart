import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_util.dart';

class HomePage extends StatelessWidget {
  final List<String> opciones = const ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
        centerTitle: true,
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
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];

    data?.forEach((elm) {
      final widgetTmp = ListTile(
        title: Text(elm['texto']),
        leading: getIcon(elm['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, elm['ruta']);
        }
      );

      opciones
        ..add(widgetTmp)
        ..add(const Divider());
    });

    return opciones;
  }
}
