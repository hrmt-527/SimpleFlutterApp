import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*------------------ Custom Widget -------------------------- */
import '../../../normal_classes/cart_related/cart_list.dart';
import 'CartWidget.dart';

/*
View the item when clicked on to it 
*/

class MyItemViewWidget<T> extends StatefulWidget {
// pass the unique key to the parent to recognize it as a widget in the tree
  MyItemViewWidget({Key? key, required this.data}) : super(key: key);

  final T data;
// override the parent method
  @override
  _MyItemViewWidget createState() => _MyItemViewWidget();
}

/*
 * Create a view to show the image and its information 
 */
class _MyItemViewWidget extends State<MyItemViewWidget> {
  double screenWidth = 0;
  double screenHeight = 0;
  String cartString = '';
  bool gotoCart = false;
  bool cartView = false;
  Key? key;

  _MyItemViewWidget() {
    this.cartString = "Add to Cart";
    this.key = UniqueKey();
  }

  /*
  if clicked then add the current item to the 
  cart i.e. send it to the data base 
  */
  void addToCart() {
    // if the item has been added to the cart then change the button text
    if (!this.gotoCart) {
      setState(() {
        this.cartString = "Go to Cart";
        CartList.addItemToCart(widget.data);
      });

      print("\n\nafter the setState\n\n");
      this.gotoCart = true;
    }

    // goto the cartView
    else {
      // for going to cart View
      setState(() {
        this.cartView = true;
      });
    }
  }

  void buyItem() {
    setState(() {
      this.cartView = true;
    });
  }

  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    if (this.cartView) {
      return MyCartWidget();
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          /*
          Container here is for giving the padding 
           */
          Container(
              /*
             * find difference between the padding and margin  
             */
              margin: EdgeInsets.only(
                  top: 10, left: screenWidth / 50, right: screenWidth / 50),
              // padding: EdgeInsets.only(
              //     top: 10, left: screenWidth / 50, right: screenWidth / 50),
              height: (screenHeight) / 2,
              width: screenWidth,
              child: Image(
                // here loss of the image data can be possible
                image: ResizeImage(
                    CachedNetworkImageProvider(widget.data.imageLocation),
                    height: (screenHeight) ~/ 2,
                    width: ((screenWidth * 24) ~/ 25)),
                width: (screenWidth * 24) / 25,
                height: (screenHeight * 2) / 3,
              )),
          Row(children: [
            Container(
                padding: EdgeInsets.all(2.0),
                width: screenWidth / 2,
                child: OutlinedButton(
                    onPressed: this.addToCart, child: Text(this.cartString))),
            Container(
                padding: EdgeInsets.all(2.0),
                width: screenWidth / 2,
                child: OutlinedButton(
                    onPressed: this.buyItem, child: Text("Buy Now"))),
          ]),
          Text("data"),
        ],
      ),
    );
  }
}
