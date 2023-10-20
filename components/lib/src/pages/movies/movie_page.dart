import 'package:flutter/material.dart';

import 'package:components/src/providers/movies_provider.dart';
import 'package:components/src/widgets/movie_slider.dart';
import 'package:components/src/widgets/card_swiper.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(title: 'Populares', movies: moviesProvider.popularMovies)
            ]
          ),
        )
    );
  }
}
