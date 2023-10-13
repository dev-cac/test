import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.cyan;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animación'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          _changeForm();
          setState(() {});
        },
      ),
    );
  }

  void _changeForm() {
    final random = Random();

    _width = random.nextInt(300).toDouble();
    _height = random.nextInt(300).toDouble();
    _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
      );

    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
  }
}
