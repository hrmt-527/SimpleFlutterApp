/* create a model which will replicate the json output
  i.e. 
  {
      id: 
      price:
      currency:
      imageLocation:
  }
  the below code is the perfect example of replica 
*/
class Product {
  int id;
  dynamic price;
  String currency;
  String imageLocation;

  Product({this.id, this.price, this.currency, this.imageLocation});

// factory not understood

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        price: json['price'],
        currency: json['currency'],
        imageLocation: json['ImageLocation']);
  }
}
