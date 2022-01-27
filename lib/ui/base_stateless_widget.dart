import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

abstract class BaseStatelessWidget<viewState extends Store>
    extends StatelessWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);
}
