// here we need to show the search bar
// items according to the api call

// we need to create a widget which will give the shop view

// wait till the full response come
import 'package:first_app/normal_classes/api_useful/API_operations.dart';
import 'widget/ItemViewWidget.dart';
import 'package:first_app/api_call.dart';
import 'package:first_app/Pages/shop_page/api_useful/flutter_model_for_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/CardWidget.dart';

class MyShopWidget extends StatefulWidget {
  MyShopWidget({Key? key}) : super(key: key);

  @override
  _MyShopWidget createState() => _MyShopWidget();
}

class _MyShopWidget extends State<MyShopWidget> {
  Future<Product>? resp;
  FutureBuilder<Product>? respWidget;
  List<Product> dataItem = [];
  int dataItemLength = 0;
  int id = 0;
  // no one is clicked initially
  int clickedDataId = -1;
  // ignore: non_constant_identifier_names
  API_Operation api_operation = new API_Operation();
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    api_operation = new API_Operation();
    print("\n initState ShopWidget");
    // call api to get the data
    getApiData();
  }

  // wait till the api response
  Future<void>? getApiData() {
    // as soon as data comes the app refresh/rebuild/call the build method

    api_operation
        .fetchDataFromApi<Product>(parseJSON, 'api.mocki.io', 'v1/30d1fe20')
        .then((value) => {
              setState(() {
                dataItem = value;
                id = dataItem[0].id;
                dataItemLength = dataItem.length;
              })
            });
    return null;
  }

  /*
  Function to view the data 
  */
  void itemView(int dataId) {
    // if the item is clicked it will come inside this function
    // change the body's view to the ItemView
    // any item has been clicked
    // will call the build method
    setState(() {
      clicked = true;
      clickedDataId = dataId;
    });
  }

  Widget build(BuildContext context) {
    if (clicked) {
      //itemView I will pass the identity of the
      return MyItemViewWidget<Product>(data: dataItem[clickedDataId]);
      //return Text("data");
    }

    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(dataItemLength, (index) {
              return Center(
                child: CardWidget(
                  data: this.dataItem[index],
                  index: index,
                  callback: itemView,
                ),
              );
            })));
  }
}
