import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mvvm/routes/routes.dart';
import 'package:flutter_mvvm/ui/base_statefull_widget.dart';
import 'package:flutter_mvvm/widgets/progress_indicator_widget.dart';

import '../base_state.dart';
import 'home_screen_view_store.dart';

class HomeScreen extends BaseStateFullWidget<HomeScreenViewStore> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateState();
}

class _CreateState extends BaseState<HomeScreenViewStore, HomeScreen> {
  final TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!viewStore.loading) {
      //Accessing news list
      viewStore.getNewsList();
    }
    _searchQuery.addListener(() {
      if (_searchQuery.text.isNotEmpty) {
        viewStore.doSearch(_searchQuery.text);
      }
    });
  }

  Widget _buildBody() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Observer(
            builder: (context) {
              return buildTitleOrSearch(viewStore.isIconSearch, "Home");
            },
          ),
          backgroundColor: Colors.deepOrange,
          actions: [
            Observer(
              builder: (context) {
                return IconButton(
                    onPressed: () => {
                          if (!viewStore.isIconSearch) {_searchQuery.text = ""},
                          viewStore.isIconSearch = !viewStore.isIconSearch,
                        },
                    icon: buildIcon(viewStore.isIconSearch));
              },
            )
          ],
        ),
        body: Observer(builder: (context) {
          return viewStore.loading
              ? const CustomProgressIndicatorWidget()
              : Material(
                  child: _buildList(),
                );
        }));
  }

  _buildList() {
    return Observer(builder: (context) {
      return (viewStore.items?.length ?? 0) > 0
          ? ListView.builder(
              itemBuilder: (BuildContext _context, int index) {
                var result = viewStore.items?[index];
                var image = "";
                try {
                  image = result?.media?[0].mediaMetadata?[0].url ?? "";
                } on RangeError catch (e) {
                  image = "";
                }
                return Card(
                    child: ListTile(
                  title: Text(
                    result?.title ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                              imageUrl: image,
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                    "https://digitalfinger.id/wp-content/uploads/2019/12/no-image-available-icon-6-350x219.png",
                                    fit: BoxFit.fill,
                                  ))),
                      height: 50,
                      width: 50,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        result?.abstract ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 15),
                      Align(
                        child: Text(
                          result?.updated ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        alignment: Alignment.bottomRight,
                      )
                    ],
                  ),
                  onTap: () => {
                    Navigator.pushNamed(context, Routes.details,
                        arguments: result)
                  },
                ));
              },
              itemCount: viewStore.items?.length,
              padding: const EdgeInsets.all(1))
          : const Center(child: Text("Empty"));
    });
  }

  buildIcon(bool isIconSearch) {
    if (isIconSearch) {
      return const Icon(Icons.search, color: Colors.white);
    }
    return const Icon(Icons.close, color: Colors.white);
  }

  buildTitleOrSearch(bool isIconSearch, String title) {
    if (isIconSearch) {
      return Text(title);
    } else {
      return TextField(
        style: const TextStyle(color: Colors.white),
        autofocus: true,
        controller: _searchQuery,
        decoration: const InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white)),
      );
    }
  }
}
