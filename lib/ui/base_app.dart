import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm/di/component/service_locator.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/stores/theme_store.dart';
import 'package:flutter_mvvm/ui/screens/detailed_screen_store.dart';
import 'package:flutter_mvvm/ui/screens/home_screen_view_store.dart';
import 'package:flutter_mvvm/ui/screens/more_details_view_store.dart';
import 'package:flutter_mvvm/ui/screens/spalsh_screen.dart';
import 'package:flutter_mvvm/ui/screens/splash_screen_store.dart';
import 'package:provider/provider.dart';

import '../appconstants/strings.dart';

class BaseApp extends StatelessWidget {
  BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ThemeStore()),
        Provider(create: (_) => getIt.get<SplashScreenViewStore>()),
        Provider(create: (_) => getIt.get<HomeScreenViewStore>()),
        Provider(create: (_) => getIt.get<DetailedScreenStore>()),
        Provider(create: (_) => getIt.get<MoreDetailsViewStore>()),
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            routes: Routes.routes,
            home: SplashScreen(),
          );
        },
        name: "global_observer",
      ),
    );
  }
}
