import 'package:get/get.dart';
import 'package:getmoneyxapp/data/model/public_people.dart';

class SearchDetailController extends GetxController {
  Data _data;
  Rx<Data> get data => _data.obs;
  int indexGoBack = 0;
  @override
  void onInit() {
    var args = Get.arguments['data'];
    indexGoBack = Get.arguments['index'];
//    print('index : $indexGoBack');
    _data = args;

//    print("args  : ${args.email}");
  }

}
