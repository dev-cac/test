import 'package:flutter/material.dart';

class BasicDesign extends StatelessWidget {
  const BasicDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FadeInImage(
            image: NetworkImage('https://images.unsplash.com/photo-1500964757637-c85e8a162699?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuZHNjYXBlJTIwb3JpZW50YXRpb258ZW58MHx8MHx8fDA%3D'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 290,
            fit: BoxFit.cover,
          ),

          const _TitleInfo(),
          const _ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text('Magna laboris tempor nostrud in eu excepteur cillum qui culpa excepteur ad esse nisi non. Non proident enim deserunt tempor veniam id do eu nisi ullamco elit commodo nulla consequat. Dolor duis consectetur labore laboris do pariatur minim. Excepteur irure exercitation nulla ex eu ipsum minim occaecat. Minim aliqua officia proident esse. Anim ullamco pariatur veniam ea adipisicing laboris tempor eiusmod laboris officia magna. Exercitation adipisicing et ullamco pariatur tempor elit aute culpa tempor sit duis duis magna id.')
          )
        ]
      )
    );
  }
}

class _TitleInfo extends StatelessWidget {
  const _TitleInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ldas AFDC Lake Campground', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Ciudad, Suiza', style: TextStyle(color: Colors.black45))
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red),
          const Text('41')
        ],
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ButtonIcon(icon: Icons.call, title: 'Call'),
          _ButtonIcon(icon: Icons.reply_outlined, title: 'Route'),
          _ButtonIcon(icon: Icons.share, title: 'Share'),
        ],
      ),
    );
  }
}

class _ButtonIcon extends StatelessWidget {
  const _ButtonIcon({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blueAccent),
        const SizedBox(height: 10),
        Text(title.toUpperCase(), style: const TextStyle(color: Colors.blue))
      ],
    );
  }
}
