import 'package:getmoneyxapp/data/provider/search_item_provider.dart';
import 'package:meta/meta.dart';

class MyRepository {
   MyApiClient apiClient = MyApiClient();

//  MyRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll({int pageNumber, int limit,String searchKeyboard}) {
    return apiClient.getAll(pageNumber,limit,searchKeyboard);
  }

//  getId(id) {
//    return apiClient.getId(id);
//  }
//
//  delete(id) {
//    return apiClient.delete(id);
//  }
//
//  edit(obj) {
//    return apiClient.edit(obj);
//  }
//
//  add(obj) {
//    return apiClient.add(obj);
//  }
}

