import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:components/src/models/band.dart';
import 'package:provider/provider.dart';

import 'package:pie_chart/pie_chart.dart';

import 'package:components/src/services/socket_service.dart';

class BandsName extends StatefulWidget {
  const BandsName({super.key});

  @override
  State<BandsName> createState() => _BandsNameState();
}

class _BandsNameState extends State<BandsName> {
  SocketService? _socketService;
  List<Band> bands = [];

  @override
  void initState() {
    _socketService = Provider.of<SocketService>(context, listen: false);
    _socketService?.socket.on('active-bands', (payload) {
      _handleActiveBands(payload);
    });

    _socketService?.socket.emit('active-bands', {});
    super.initState();
  }

  @override
  void dispose() {
    _socketService?.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BandName', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socketService.serverStatus == ServerStatus.Online
              ? Icon(Icons.check_circle, color: Colors.blue[300])
              : Icon(Icons.offline_bolt, color: Colors.red[300]),
          )
        ],
      ),
      body: Column(
        children: [
          _showGraph(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (BuildContext context, int i) => _bandTile(bands[i])
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  Dismissible _bandTile(Band band) {
    final socketService = Provider.of<SocketService>(context, listen: false);

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        socketService.emit('delete-band', { 'id': band.id });
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
        onTap: () => socketService.emit('vote-band', { 'id': band.id }),
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
      final socketService = Provider.of<SocketService>(context, listen: false);
      socketService.emit('add-band', { 'name': name });
    }

    Navigator.pop(context);
  }

  _handleActiveBands(dynamic payload) {
     bands = (payload as List)
      .map((band) => Band.fromMap(band))
      .toList();

    setState(() {});
  }

  Widget _showGraph() {
    Map<String, double> dataMap = {};

    for (var band in bands) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    }

    if (dataMap.isEmpty) {
      return const Center(
        child: Text('No info.'),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Bands",
        legendOptions: const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      )
    );
  }
}
