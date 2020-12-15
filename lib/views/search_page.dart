import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getmoneyxapp/controllers/search_controller.dart';
import 'package:getmoneyxapp/views/search_detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchController searchController = SearchController();
  int pageNumber = 1;

  Widget appBarTitle = new Text(
    "Search",
    style: new TextStyle(color: Colors.white),
  );

  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );

  final TextEditingController _searchQuery = new TextEditingController();

  bool _IsSearching;

  void _handleSearchStart() {
//    setState(() {
//      _IsSearching = true;
//    });
  }

  void _handleSearchEnd() async {
    _searchQuery.clear();
    await Get.find<SearchController>()
        .loadPeople(isBack: false, isReload: true);
//    setState(() {
//      this.actionIcon = new Icon(
//        Icons.search,
//        color: Colors.white,
//      );
//      this.appBarTitle = new Text(
//        "Search",
//        style: new TextStyle(color: Colors.white),
//      );
//      _IsSearching = false;
//    });
  }

  @override
  void didChangeDependencies() {
//    searchController.onListScroll();

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: SafeArea(
        child: GetBuilder<SearchController>(
            init: SearchController(),
            initState: (state) {},
            builder: (controller) {
//            if (controller.searchRequestStatus.value ==
//                SearchRequestStatus.loading) {
//              return Center(child: CircularProgressIndicator());
//            }
              return Column(
                children: <Widget>[
//                  SizedBox(
//                    height: 20,
//                  ),
                  AnimatedContainer(
                    alignment: AlignmentDirectional.topCenter,
                    height: controller.showAppbar ? 100 : 0.0,
                    duration: Duration(milliseconds: 200),
                    child: AppBar(
                      leading: Container(),
                      flexibleSpace: TextField(
                        controller: controller.searchController,
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: (value) async {
//                          await Get.find<SearchController>()
//                              .searchPeople(searchKeyword: value);
                          await controller.searchPeople();
                        },
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            prefixIcon: AnimatedContainer(
                              child: Icon(
                                  controller.showAppbar ? Icons.search : null,
                                  color: Colors.white),
                              duration: Duration(milliseconds: 200),
                            ),
                            suffix: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              child: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  controller.onClearTextField();
                                },
                              ),
                            ),
                            hintText: "Search...",
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
//                  AnimatedContainer(
//                    alignment: AlignmentDirectional.topCenter,
//                    height: _showAppbar ? 80: 0.0,
//                    duration: Duration(milliseconds: 200),
//                    child:  AppBar(
//                      flexibleSpace: Container(),
//                        centerTitle: true, title: appBarTitle, actions: <Widget>[
//                 IconButton(
//                  icon: actionIcon,
//                  onPressed: () {
//                    setState(() {
//                      if (this.actionIcon.icon == Icons.search) {
//                        this.actionIcon = new Icon(
//                          Icons.close,
//                          color: Colors.white,
//                        );
//                        this.appBarTitle = new TextField(
//                          controller: _searchQuery,
//                          style: new TextStyle(
//                            color: Colors.white,
//                          ),
//                          onChanged: (value) async {
//                            await Get.find<SearchController>()
//                                .searchPeople(searchKeyword: value);
//                          },
//                          decoration: new InputDecoration(
//                              prefixIcon: new Icon(Icons.search, color: Colors.white),
//                              hintText: "Search...",
//                              hintStyle: new TextStyle(color: Colors.white)),
//                        );
//                        _handleSearchStart();
//                      } else {
//                        _handleSearchEnd();
//                      }
//                    });
//                  },
//                ),
//              ]),
//                  ),
                  Expanded(
                    child: Container(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollInfo) {
                          if (controller.isLoading != true &&
                              scrollInfo.metrics.pixels ==
                                  scrollInfo.metrics.maxScrollExtent) {
                            controller.isLoading = true;
                            Get.find<SearchController>()
                                .loadPeople(isBack: false);
                          }
                        },
                        child: ListView.builder(
                          controller: controller.scrollViewController,
                          shrinkWrap: true,
                          itemCount: controller.lstPeople.length,
                          itemBuilder: (context, index) {
                            int id = 1;
                            id++;
                            return GestureDetector(
                              onTap: () async {
                                Map<String, dynamic> person = {
                                  'data': controller.lstPeople[index],
                                  'index': index,
                                };
                                controller.activeIndex = await Get.to(
                                    SearchDetailPage(),
                                    arguments: person);
                              },
                              child: ListTile(
                                trailing: Text(
                                    controller.lstPeople[index].id.toString()),
                                title: Text(
                                    '${controller.lstPeople[index].email}'),
                                subtitle:
                                    Text('${controller.lstPeople[index].id}'),
                                selected: controller.activeIndex == index
                                    ? true
                                    : false,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:
                        controller.isLoading && controller.hasNext ? 50.0 : 0,
                    color: Colors.transparent,
                    child: Center(
                      child: new CircularProgressIndicator(),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
