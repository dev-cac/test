import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;
  Function get emit => _socket.emit;

  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    try {
      _socket = IO.io(
        'http://127.0.0.1:3000',
          IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
      );

      _socket.onConnect((_) {
        _serverStatus = ServerStatus.Online;
        notifyListeners();
      });

      _socket.onConnectError((error) {
        _serverStatus = ServerStatus.Offline;
        notifyListeners();
      });

      _socket.onConnectTimeout((data) {
        _serverStatus = ServerStatus.Offline;
        notifyListeners();
      });

      _socket.onDisconnect((_) {
        _serverStatus = ServerStatus.Offline;
        notifyListeners();
      });

      /* _socket.on('nuevo-mensaje', (payload) {
        print('Nombre: ${payload['nombre']}');
        print('Mensaje: ${payload['mensaje']}');
      }); */
    } catch (e) {
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    }
  }

  void dispose() {
    _socket.disconnect();
    super.dispose();
  }
}
