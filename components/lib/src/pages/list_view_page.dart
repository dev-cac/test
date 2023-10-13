import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listNumbs = [0, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemCount: _listNumbs.length,
      itemBuilder: (context, index) {
        final image = _listNumbs[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/seed/$image/500/300'),
          placeholder: const AssetImage('assets/jar-loading.gif'),
          fadeInDuration: const Duration(milliseconds: 200),
          height: 290,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
