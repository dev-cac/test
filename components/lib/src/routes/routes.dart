import 'package:flutter/material.dart';

import 'package:components/src/pages/pages.dart';

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
    'pelis_details': (_) => const DetailsScreen(),
    'basic_design': (_) => const BasicDesign(),
    'scroll_design': (_) => const ScrollDesign(),
  };
}
