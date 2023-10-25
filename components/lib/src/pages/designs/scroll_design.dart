import 'package:flutter/material.dart';

class ScrollDesign extends StatelessWidget {
  const ScrollDesign({super.key});

  @override
  Widget build(BuildContext context) {
    const gradientBg = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 0.6],
        colors: [
          Color(0xff5EE8C5),
          Color(0xff30BAD6)
        ]
      )
    );

    return Scaffold(
      backgroundColor: const Color(0xff30BAD6),
      body: Container(
        decoration: gradientBg,
        child: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: const [
            Page1(),
            Page2()
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Background(),
        MainContent()
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white);

    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text('11°', style: textStyle),
          const Text('Miércoles', style: textStyle),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white)
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      height: double.infinity,
      alignment: Alignment.topCenter,
      child: const Image(image: AssetImage('assets/images/scroll-1.png'))
    );
  }
}

/* ========================================== */

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: const Color(0xff0098FA), shape: const StadiumBorder()),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('Bienvenido', style: TextStyle(color: Colors.white, fontSize: 30)),
          ),
          onPressed: () {},
        )
        ),
    );
  }
}
