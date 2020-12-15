import 'dart:convert';
import 'package:getmoneyxapp/data/model/public_people.dart';
import 'package:http/http.dart' as http;

class MyApiClient {
//  final http.Client httpClient;
//
//  MyApiClient({@required this.httpClient});

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<PublicPeople> getAll(
      int pageNumber, int limit, String searchKeyboard) async {
    if(searchKeyboard.isEmpty)
      {
        final baseUrl =
            "http://127.0.0.1:8000/api/public-people?page=$pageNumber&limit=$limit";
        print('baseUrl showing : $baseUrl');
        try {
          final response = await http.get(baseUrl, headers: _defaultHeaders);
          if (response.statusCode == 200) {
            print("result: ${json.decode(response.body )}\n");
            return PublicPeople.fromJson(json.decode(response.body));
          } else {
            print('response :${response.statusCode}');
          }
        } catch (ex) {
          print("message error inside catch ->  $ex");
        }
      }else
        {
          final baseUrl =
              "http://127.0.0.1:8000/api/public-people?page=$pageNumber&limit=$limit&data=$searchKeyboard";
          print('baseUrl showing : $baseUrl');
          try {
            final response = await http.get(baseUrl, headers: _defaultHeaders);
            if (response.statusCode == 200) {
              print("result: ${json.decode(response.body)}");
              return PublicPeople.fromJson(json.decode(response.body));
            } else {
              print('response :${response.statusCode}');
            }
          } catch (ex) {
            print("message error inside catch ->  $ex");
          }
        }

  }

//  Future getId(id) async {
//    try {
//      final response = await http.get(baseUrl);
//      if (response.statusCode == 200) {
//        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//        // TODO: implement methods!
//      } else {
//        print('Error -getId');
//      }
//    } catch (_) {}
//    return null;
//  }
//
//  Future add(obj) async {
//    try {
//      final response = await http.post(baseUrl,
//          headers: _defaultHeaders, body: jsonEncode(obj));
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else {
//        print('Error -add');
//      }
//    } catch (_) {}
//    return null;
//  }
//
//  Future edit(obj) async {
//    try {
//      final response = await http.put(baseUrl,
//          headers: _defaultHeaders, body: jsonEncode(obj));
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else {
//        print('Error -edit');
//      }
//    } catch (_) {}
//    return null;
//  }
//
//  Future delete(obj) async {
//    try {
//      final response = await http.delete(baseUrl);
//      if (response.statusCode == 200) {
//        // TODO: implement methods!
//      } else {
//        print('Error -delete');
//      }
//    } catch (_) {}
//    return null;
//  }
}
