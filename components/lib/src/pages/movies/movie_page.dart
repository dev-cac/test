import 'package:flutter/material.dart';

import 'package:components/src/widgets/movie_slider.dart';
import 'package:components/src/widgets/card_swiper.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en Cine'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(),
              MovieSlider(),
              MovieSlider(),
              MovieSlider()
            ]
          ),
        )
    );
  }
}
