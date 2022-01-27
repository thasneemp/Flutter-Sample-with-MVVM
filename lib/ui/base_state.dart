import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

abstract class BaseState<viewState extends Store, T extends StatefulWidget>
    extends State<T> {
  late viewState _state;

  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();
    _state = Provider.of<viewState>(context);
  }
  viewState get viewStore => _state;
}
