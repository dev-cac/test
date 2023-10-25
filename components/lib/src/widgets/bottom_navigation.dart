import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:components/src/providers/ui_provider.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({ super.key });

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      elevation: 0,
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map, size: 30),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration_outlined, size: 30),
          label: 'Direcciones'
        ),
      ],
    );
  }
}
