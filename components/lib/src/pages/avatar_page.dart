import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
        Container(
          padding: const EdgeInsets.all(4),
          child: const CircleAvatar(
            backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod/images/stan-lee-wandavision-cameo-tributo-homenaje-1614077568.jpg'),
            radius: 20,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: CircleAvatar(
            backgroundColor: Colors.purple.shade300,
            child: const Text('SL'),
          ),
         )
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage('https://t3.ftcdn.net/jpg/05/85/86/44/360_F_585864419_kgIYUcDQ0yiLOCo1aRjeu7kRxndcoitz.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 290,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
