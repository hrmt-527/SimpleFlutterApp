import 'dart:convert';

import 'normal_classes/api_useful/API_operations.dart';
import 'pages/shop_page/api_useful/flutter_model_for_json.dart';

/*
 * This function will parse the Json Body data and return the appropriate ans
 */
List<Product> parseJSON(resBody) {
  // GET THE JSON FORMAT
  var jsonBody = jsonDecode(resBody);

  // this contains List<Dynamic> jsonBody["items"]
  // I need to convert this to List<Product>
  print(jsonBody["items"].runtimeType);
  List<dynamic> itemList = jsonBody["items"];

  print(itemList.runtimeType);
  List<Product> convertedList = [];

  for (var item in itemList) {
    // each item should be an JSON convert it into the model
    convertedList.add(Product.fromJson(item));
  }
  return convertedList;
}

/*
optional testing function to check 
*/
void function() {
  API_Operation apiOperation = new API_Operation();

  apiOperation.fetchDataFromApi<Product>(
      parseJSON, 'api.mocki.io', 'v1/30d1fe20');

//old  e0a30e1d
}
