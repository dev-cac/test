import 'package:components/src/widgets/card_table.dart';
import 'package:flutter/material.dart';

import 'package:components/src/widgets/background.dart';
import 'package:components/src/widgets/custom_button_navigation.dart';
import 'package:components/src/widgets/page_title.dart';

class ComposeDesign extends StatelessWidget {
  const ComposeDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          _HomeBody()
        ],
      ),
      bottomNavigationBar: ButtonNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(),
          CardTable()
        ]
      ),
    );
  }
}
