import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:getmoneyxapp/controllers/search_controller.dart';
import 'package:getmoneyxapp/data/provider/search_item_provider.dart';
import 'package:getmoneyxapp/data/repositories/people_repository.dart';
import 'package:http/http.dart' as http;

//class PeopleBinding implements Bindings {
//
//  @override
//  void dependencies() {
//    Get.lazyPut<SearchController>(() {
//      return SearchController(
//          peopleRepository: MyRepository(
//              apiClient: MyApiClient(httpClient: http.Client())));
//    });
//  }
//
//}
