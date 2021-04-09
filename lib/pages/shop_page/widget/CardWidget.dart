import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/* --------------------------- Custom ----------------------------------------   */
import 'package:first_app/Pages/shop_page/api_useful/flutter_model_for_json.dart';

/*
 * Parameters 
 * data :  data for the card 
 * callback : if the image is tapped
 * 
 * returning a card with data
 */

class CardWidget extends StatelessWidget {
  CardWidget(
      {Key? key,
      required this.data,
      required this.index,
      required this.callback})
      : super(key: key);
  final Product data;
  final Function callback;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Card(
        elevation: 20,
        margin: EdgeInsets.only(
          left: width / 50,
          right: width / 50,
          top: height / 50,
        ),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: (width * 23) / 50,
              child: GestureDetector(
                onTap: () {
                  print("Image Tapped");
                  // add to cart
                  callback(index);
                },
                child: Image(
                  image: CachedNetworkImageProvider(
                    data.imageLocation,
                  ),
                  //NetworkImage(data.imageLocation),
                  height: (width * 23) / 50 - 30,
                  width: (width * 23) / 50,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("Price : " + data.price.toString()),
            )
          ],
        ));
  }
}
