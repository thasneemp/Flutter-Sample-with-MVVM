import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/ui/base_state.dart';
import 'package:flutter_mvvm/ui/base_statefull_widget.dart';
import 'package:flutter_mvvm/ui/screens/splash_screen_store.dart';
import 'package:flutter_mvvm/widgets/empty_app_bar_widget.dart';

class SplashScreen extends BaseStateFullWidget<SplashScreenViewStore> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimerState();
  }
}

class _TimerState extends BaseState<SplashScreenViewStore, SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacementNamed(Routes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: const EmptyAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return const Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
            child: Text(
          "Welcome",
          style: TextStyle(color: Colors.white, fontSize: 50),
        )));
  }
}
