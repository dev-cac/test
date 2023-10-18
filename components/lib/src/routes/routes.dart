import 'package:components/src/pages/bands_status.dart';
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
    '/': (_) => const HomePage(),
    'alert': (_) => const AlertPage(),
    'avatar': (_) => const AvatarPage(),
    'card': (_) => const CardPage(),
    'animated': (_) => const AnimatedPage(),
    'inputs': (_) => const InputPage(),
    'slider': (_) => const SliderPage(),
    'list': (_) => const ListViewPage(),
    'camera': (_) => const CameraScreenPage(),
    'bands': (_) => const BandsName(),
    'bands_status': (_) => const BandsStatus(),
  };
}
