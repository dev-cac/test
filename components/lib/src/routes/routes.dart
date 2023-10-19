import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/components/alert_page.dart';
import 'package:components/src/pages/components/avatar_page.dart';
import 'package:components/src/pages/components/card_page.dart';
import 'package:components/src/pages/components/animated_page.dart';
import 'package:components/src/pages/components/inputs_page.dart';
import 'package:components/src/pages/components/slider_page.dart';
import 'package:components/src/pages/components/list_view_page.dart';
import 'package:components/src/pages/components/camera_screen.dart';
import 'package:components/src/pages/band/bands_app.dart';
import 'package:components/src/pages/movies/movie_page.dart';

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
    'pelis': (_) => const MoviePage(),
  };
}
