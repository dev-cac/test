import 'package:flutter/material.dart';

import 'package:components/src/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ) : Container(),
          const SizedBox(height: 7),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (_, int i) {
                return _MoviePoster(movies[i]);
              }
            ),
          ),
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'pelis_details', arguments: 'movie-xd'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                image: NetworkImage(movie.fullPosterImg),
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
                width: 130,
                height: 190,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis
          )
        ]
      ),
    );
  }
}
