import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _listNumbs = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addTenItems();
    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading()
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPage1,
      child: ListView.builder(
        itemCount: _listNumbs.length,
        controller: _scrollController,
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
      ),
    );
  }

  void _addTenItems() {
    for (var i = 1; i <= 10; i++) {
      _lastItem++;
      _listNumbs.add(_lastItem);

      setState(() {});
    }
  }

  Timer fetchData() {
    _isLoading = true;
    setState(() {});

    const duration = Duration(seconds: 2);
    return Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250)
    );
    _addTenItems();
  }

  Future<void> getPage1() async {
    const duration = Duration(seconds: 2);

    Timer(duration, () {
      _listNumbs.clear();
      _lastItem++;
      _addTenItems();
    });

    return Future.delayed(duration);
  }

  Widget _createLoading() {
    if (_isLoading) {
      return const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator()
            ],
           ),
           SizedBox(height: 20)
        ],
      );
    } else {
      return Container();
    }
  }
}
