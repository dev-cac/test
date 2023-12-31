import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:provider/provider.dart';

import 'package:components/src/services/socket_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
        ],
        title: 'Componentes App',
        initialRoute: '/',
        routes: getApplicationRoutes(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) => const AlertPage());
        },
      ),
    );
  }
}
