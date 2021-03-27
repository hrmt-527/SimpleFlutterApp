/*
 * call the API using fetch api 
 * Parameters : 
 * 
 *    callback : Callback for parsing the data 
 *    url : api url
 *    unencodedpath : api function 
 */
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<T>> fetchDataFromApi<T>(Function callback, String url,
    [String unencodedpath]) async {
  // response from the api
  final response = await http.get(Uri.https(url, unencodedpath));

  //  _InternalLinkedHashMap<String, List<dynamic>>
  print(jsonDecode(response.body).runtimeType);

  // convert the response body into JSON map
  if (response.statusCode == 200 || response.statusCode == 201) {
    return callback(response.body);
  } else {
    throw Exception('Failed to load data, plz check your network connection');
  }
}

/**
 * Class has the different methods
 * Methods are performing the different api calls 
 */
class API_Operation {
  /*

    this function try to call the api for inserting the data and return the response of API

  */
  void insertData = () => {/* Return the response */};

  Future<List<T>> fetchDataFromApi<T>(Function callback, String url,
      [String unencodedpath]) async {
    // response from the api
    final response = await http.get(Uri.https(url, unencodedpath));

    //  _InternalLinkedHashMap<String, List<dynamic>>
    print(jsonDecode(response.body).runtimeType);

    // convert the response body into JSON map
    if (response.statusCode == 200 || response.statusCode == 201) {
      return callback(response.body);
    } else {
      throw Exception('Failed to load data, plz check your network connection');
    }
  }
}
