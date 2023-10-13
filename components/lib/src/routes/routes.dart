import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
  };
}
