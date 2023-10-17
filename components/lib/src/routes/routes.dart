import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/animated_page.dart';
import 'package:components/src/pages/inputs_page.dart';
import 'package:components/src/pages/slider_page.dart';
import 'package:components/src/pages/list_view_page.dart';
import 'package:components/src/pages/camera_screen.dart';
import 'package:components/src/pages/bands_app.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animated': (BuildContext context) => const AnimatedPage(),
    'inputs': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListViewPage(),
    'camera': (BuildContext context) => const CameraScreenPage(),
    'bands': (BuildContext context) => const BandsName(),
  };
}
