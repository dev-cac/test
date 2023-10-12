import 'package:flutter/material.dart';

import 'package:components/src/pages/home_temp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      home: HomePageTemp()
    );
  }
}
