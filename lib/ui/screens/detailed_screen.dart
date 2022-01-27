import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/news/results.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/ui/base_state.dart';
import 'package:flutter_mvvm/ui/base_statefull_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'detailed_screen_store.dart';

class DetailedScreen extends BaseStateFullWidget<DetailedScreenStore> {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _createState();
}

class _createState extends BaseState<DetailedScreenStore, DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Results;
    return _body(arguments, context);
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
}

Widget _body(Results? arguments, BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(arguments?.title ?? ""),
        backgroundColor: Colors.deepOrange,
      ),
      body: _buildDetails(arguments, context));
}

_buildDetails(Results? arguments, BuildContext context) {
  var image = "";
  try {
    image = arguments?.media?[0].mediaMetadata?[2].url ?? "";
  } on RangeError catch (e) {
    image = "";
  }
  return Material(
    child: Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            errorWidget: (context, url, error) => Image.network(
              "https://digitalfinger.id/wp-content/uploads/2019/12/no-image-available-icon-6-350x219.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(arguments?.title ?? "",
                style: const TextStyle(fontSize: 25)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(arguments?.abstract ?? ""),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.more_details,
                        arguments: arguments);
                  },
                  child: const Text(
                    "ReadMore....",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
                alignment: Alignment.topCenter,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
