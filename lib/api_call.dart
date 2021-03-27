import 'dart:convert';

import 'package:first_app/API_operations.dart';
import 'package:first_app/flutter_model_for_json.dart';

/*
 * This function will parse the Json Body data and return the approprate ans
 */
List<Product> parseJSON(resBody) {
  // GET THE JSON FORMAT
  var jsonBody = jsonDecode(resBody);

  // this contains List<Dynamic> jsonBody["items"]
  // I need to convert this to List<Product>
  print(jsonBody["items"].runtimeType);
  List<dynamic> itemList = jsonBody["items"];

  print(itemList.runtimeType);
  List<Product> convertedList = new List<Product>(itemList.length);

  int index = 0;
  for (var item in itemList) {
    // print(item.runtimeType);
    // print(item);
    // print(item["id"]);
    //print(item["id"] + "\n");
    // each item should be an JSON convert it into the model
    convertedList[index] = Product.fromJson(item);
    index++;
  }
  return convertedList;
}

/*
optional testing function to check 
*/
void function() {
  Future<List<Product>> list;
  API_Operation api_operation = new API_Operation();

  list = api_operation.fetchDataFromApi<Product>(
      parseJSON, 'api.mocki.io', 'v1/30d1fe20');

//old  e0a30e1d
  //print("Runtime of list is : " + list.runtimeType.toString());

  // now i have the list of the JSON data hence
}
