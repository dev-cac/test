import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          ),
          SizedBox(height: 7),
          _MoviePoster()
        ]
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (_, int i) {
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
                    child: const FadeInImage(
                      image: NetworkImage('https://via.placeholder.com/300x400'),
                      placeholder: AssetImage('assets/images/no-image.jpg'),
                      fit: BoxFit.cover,
                      width: 130,
                      height: 190,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'StarWars: El retorno del nuevo Jedi',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis
                )
              ]
            ),
          );
        }
      ),
    );
  }
}
