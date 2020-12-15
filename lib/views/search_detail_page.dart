import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmoneyxapp/controllers/search_controller.dart';
import 'package:getmoneyxapp/controllers/search_detail_controller.dart';
class SearchDetailPage extends StatelessWidget {
//  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GetX<SearchDetailController>(
        init: SearchDetailController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Search Details Page'),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.pink,
                onPressed: () async {
                  Get.back(result: controller.indexGoBack);
//                  controller.indexGoBack
                  await Get.find<SearchController>().loadPeople(isBack: true);
                },
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Text(
                    controller.data.value.phone,
                    style: TextStyle(fontSize: 22),
                  ),
                  FlatButton(
                      onPressed: () async {
                        Get.back(result: controller.indexGoBack);
//                  controller.indexGoBack
                        await Get.find<SearchController>()
                            .loadPeople(isBack: true);
                      },
                      child: Text('Back'))
                ],
              ),
            ),
          );
        });
  }
}
