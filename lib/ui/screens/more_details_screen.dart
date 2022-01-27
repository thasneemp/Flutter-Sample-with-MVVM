import 'package:flutter/material.dart';
import 'package:flutter_mvvm/ui/base_state.dart';
import 'package:flutter_mvvm/ui/base_statefull_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../models/news/results.dart';
import 'more_details_view_store.dart';

class MoreDetailsScreen extends BaseStateFullWidget<MoreDetailsViewStore> {
  const MoreDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateState();
}

class _CreateState extends BaseState<MoreDetailsViewStore, MoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Results;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title ?? ""),
        backgroundColor: Colors.deepOrange,
      ),
      body: WebView(
        initialUrl: arguments.url,
      ),
    );
  }
}
