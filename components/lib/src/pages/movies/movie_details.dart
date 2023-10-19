import 'package:flutter/material.dart';

import 'package:components/src/widgets/card_casting.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            const _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                const _PosterAndTitle(),
                const _Overview(),
                const _Overview(),
                const _Overview(),
                const CastingCards()
              ]),
            )
          ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text('movie.title', style: TextStyle(fontSize: 16),)
        ),
        background: const FadeInImage(
          image: NetworkImage('https://via.placeholder.com/500x300'),
          placeholder: AssetImage('assets/images/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage('https://t3.ftcdn.net/jpg/05/85/86/44/360_F_585864419_kgIYUcDQ0yiLOCo1aRjeu7kRxndcoitz.jpg'),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox( width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox( height: 10),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 20, color: Colors.amber),
                  const SizedBox( width: 5),
                  Text('movie.voteAverage', style: textTheme.caption)
                ]
              )
            ],
          )
        ]
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Minim sunt amet nostrud ipsum sit excepteur ex officia reprehenderit dolor quis est. In ad tempor tempor commodo id laborum nisi anim Lorem consequat excepteur officia occaecat laboris. Anim incididunt pariatur et duis sit do elit magna. Adipisicing anim nulla dolore nisi nulla est est commodo ullamco culpa ea exercitation ad commodo.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      )
    );
  }
}
