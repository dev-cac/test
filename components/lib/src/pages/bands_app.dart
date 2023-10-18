import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:components/src/models/band.dart';

class BandsName extends StatefulWidget {
  const BandsName({super.key});

  @override
  State<BandsName> createState() => _BandsNameState();
}

class _BandsNameState extends State<BandsName> {
  List<Band> bands = [
    Band(id: '1', name: 'As Guitar', votes: 0),
    Band(id: '2', name: 'Tg Guitar2', votes: 3),
    Band(id: '3', name: 'Op Guitar3', votes: 2),
    Band(id: '4', name: 'Wp Guitar4', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BandName', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int i) => _bandTile(bands[i])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  Dismissible _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('id: ${band.id}');
      },
      background: Container(
        padding: const EdgeInsets.only(left: 10),
        color: const Color.fromARGB(255, 225, 180, 184),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white))
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0,2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: const TextStyle(fontSize: 19)),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Name Band:'),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              elevation: 5,
              onPressed: () => addBandToList(textController.text),
              textColor: Colors.blue,
              child: const Text('Add'),
            )
          ],
        );
      });
    }

    showCupertinoDialog(context: context, builder: (_) {
      return CupertinoAlertDialog(
        title: const Text('New Band Name:'),
        content: CupertinoTextField(
          controller: textController,
        ),
        actions: [
           CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Add'),
            onPressed: () => addBandToList(textController.text),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Dismiss'),
            onPressed: () => Navigator.pop(context)
          )
        ],
      );
    });
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: DateTime.now().toString(), name: name));
      setState(() {});
    }

    Navigator.pop(context);
  }
}