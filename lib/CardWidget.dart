import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'flutter_model_for_json.dart';

/*
 * Parameters 
 * data :  data for the card 
 * callback : if the image is tapped
 */

class CardWidget extends StatelessWidget {
  CardWidget({Key key, this.data, this.index, this.callback}) : super(key: key);
  final Product data;
  final Function callback;
  final int index;
  // returning a card having the data to show
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Card(
        elevation: 20,

        // shape: ShapeBorder(),
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
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //       // background image should be a blank image
              //       image: NetworkImage(data.imageLocation),
              //       fit: BoxFit.fitWidth,
              //       alignment: Alignment.topCenter,
              //     ),
              //     shape: BoxShape.circle),
              child: GestureDetector(
                onTap: () {
                  // add to cart

                  callback(index);
                  print("Image Tapped");
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
              // SizedBox(
              //   child: Image(
              //     image:  NetworkImage(data.imageLocation),
              //     height: (width * 23) / 50 - 30,
              //   width: (width * 23) / 50,
              //   ),

              //   height: (width * 23) / 50 - 30,
              //   width: (width * 23) / 50,
              // ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("Price : " + data.price.toString()),
            )
          ],
        ));
  }
}

/**
  Card(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              // will show the image from the network
              // need to fit the image into the cards so that price can be shown
              Image.network(
                data.imageLocation,
                fit: BoxFit.fill,
              ),
              // Image(
              //     image: AssetImage(
              //         "C:\\Users\\gi\\OneDrive\\Pictures\\Saved_Pictures\\inception.jpg")),
              //Text(data.id.toString()),

              Text(data.price.toString()),
            ],
          ),
        ));
 */
