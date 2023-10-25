import 'package:components/src/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:components/src/pages/qr/address.dart';
import 'package:components/src/pages/qr/history.dart';
import 'package:components/src/widgets/bottom_navigation.dart';
import 'package:components/src/widgets/scan_button.dart';

class QrHome extends StatelessWidget {
  const QrHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomBottomNavigation(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch(currentIndex) {
      case 0:
        return const HistoryPage();
      case 1:
        return const AddressPage();

      default:
        return const HistoryPage();
    }

  }
}
