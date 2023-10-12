import 'package:flutter/material.dart';
import 'package:hello_flutter/src/pages/counter_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: CounterPage(),
      ),
    );
  }

}
