import 'package:flutter/material.dart';

import '../views/pages/main_page.dart';
import '../views/pages/review_page.dart';

class RouteManager {
  static const String mainPage = '/';
  static const String reviewPage = '/reviewPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      case reviewPage:
        return MaterialPageRoute(
          builder: (context) => const ReviewPage(),
        );

      default:
        throw Exception('Check pages. The one you used does not exist!');
    }
  }
}
