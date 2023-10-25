import 'package:flutter/material.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined, size: 30),
          label: 'Calendario'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_outline_outlined, size: 30),
          label: 'Gráfica'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined, size: 30),
          label: 'Usuarios'
        )
      ]
    );
  }
}
