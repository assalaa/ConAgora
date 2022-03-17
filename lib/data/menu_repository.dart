import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'category_list_data.dart';

class MenuRepository {
  //  var _postsJson = [];
  // final url = "http://192.168.1.25:2020/api/v2/menu";
 
  // Future<void> fetchPosts() async {
  //   try {
  //     final response = await get(Uri.parse(url));
  //     final jsonData = jsonDecode(response.body) as List;

  //     setState(() {
  //       _postsJson = jsonData;
  //     });
  //   } on Exception catch (e) {
  //     print(e);
  //   }
  // }

 

  Future<List<MenuModel>> fetchMenu() async {
    Uri api = Uri.parse("http://192.168.43.180:2020/api/v2/menu");
    try {
      var response = await get(api);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        print(response.body);
        var mappedData=data.map<MenuModel>((dish) =>(MenuModel.fromJson(dish))).toList();
        
        return mappedData;
      } else {
        print(response.statusCode);
      }
     
    } on Exception catch (e) {
      print(e);
    }
    throw (Exception);
  }

  // int? itemNumber() {
  //   for (var i = 0; i <= menu.length; i++) {
  //     return i;
  //   }
  // }
}
