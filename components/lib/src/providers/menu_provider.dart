import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider(){
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    String res = await rootBundle.loadString('data/menu_opts.json');
    Map<String, dynamic> datMap = json.decode(res);

    opciones = datMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
