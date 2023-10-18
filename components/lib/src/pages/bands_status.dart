import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:components/src/services/socket_service.dart';

class BandsStatus extends StatelessWidget {
  const BandsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Texto D:'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}')
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_rounded),
        onPressed: () {
           socketService.socket.emit('nuevo-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola desde flutter'
           });
        },
      )
    );
  }
}
