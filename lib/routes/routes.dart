import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm/ui/screens/detailed_screen.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/more_details_screen.dart';
import '../ui/screens/spalsh_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String details = '/details';
  static const String more_details = '/more_details';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => const HomeScreen(),
    details: (BuildContext context) => const DetailedScreen(),
    more_details: (BuildContext context) => const MoreDetailsScreen(),
  };
}
