import 'package:first_app/normal_classes/cart_related/cart_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
Add the item to the cart List 
Cart List either global or static
*/
class MyCartWidget extends StatefulWidget {
  MyCartWidget({Key? key}) : super(key: key);

  @override
  _MyCartWidget createState() => _MyCartWidget();
}

/*
 * Cart should have list of items which you have picked with number of quantity
 * list view 
 */

class _MyCartWidget extends State<MyCartWidget> {
  List<dynamic> itemList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // affect in the memory reference
    itemList = CartList.cartItemList;
    if (itemList.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              print("back Pressed ");
            },
          ),
        ),
        body: Center(
          child: Text("Nothing in the Cart"),
        ),
      );
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: CartList.cartItemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("item_" + itemList[index].id.toString()),
            trailing: Text(
                "Quantity : " + CartList.getItemQuantity(itemList[index].id)),
          );
        },
      ),
    );
  }
}

/*
 * This class has the view of :
 *  how an item of the list will look 
 */

// class SingleCartItemView extends StatefulWidget {
//   SingleCartItemView({Key? key }) : super(key: key);

//   @override
//   _SingleCartItemView createState() => _SingleCartItemView();
// }

// class _SingleCartItemView extends State<SingleCartItemView> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
