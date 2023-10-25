import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blue,
              icon: Icons.ac_unit_rounded,
              text: 'General',
            ),
            _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.cable_outlined,
              text: 'Transport',
            ),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.purple,
              icon: Icons.add_alert_outlined,
              text: 'Shopping',
            ),
            _SingleCard(
              color: Colors.orangeAccent,
              icon: Icons.accessible_sharp,
              text: 'Bills',
            ),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.blueGrey,
              icon: Icons.snowmobile_rounded,
              text: 'Entertainment',
            ),
            _SingleCard(
              color: Colors.green,
              icon: Icons.candlestick_chart_sharp,
              text: 'Grocery',
            ),
          ]
        ),
        TableRow(
          children: [
            _SingleCard(
              color: Colors.white54,
              icon: Icons.accessible_forward,
              text: 'Other',
            ),
            _SingleCard(
              color: Colors.deepOrangeAccent,
              icon: Icons.dark_mode,
              text: 'Item',
            ),
          ]
        )
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    required this.icon,
    required this.color,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, size: 35, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(text, style: TextStyle(color: color, fontSize: 18))
        ],
      )
    );
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: const Color.fromRGBO(62, 66, 107, 0.7)
  );

  _CardBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 180,
            decoration: boxDecoration,
            child: child,
          ),
        ),
      ),
    );
  }
}
