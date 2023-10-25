import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  final decorationBg = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.2, 0.8],
      colors: [
        Color(0xff2E305F),
        Color(0xff202333)
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: decorationBg),
        const Positioned(
          top: -90,
          left: -30,
          child: _PinkBox()
        )
      ]
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(251, 142, 172, 0.8)
            ]
          )
        ),
      ),
    );
  }
}
