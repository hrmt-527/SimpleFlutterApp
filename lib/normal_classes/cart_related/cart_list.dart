/*
 Restrict the access for this class from the other widgets 
*/
class CartList {
  // List of cart Items
  static List<dynamic> cartItemList = [];

  // Id and itemQuantity
  static Map<String, int> itemQuantity = Map<String, int>();

  static void addItemToCart(dynamic item) {
    // assert(itemQuantity, null)

    cartItemList.length = 0;

    // check if the same item id is present then increase the number of quantity of the item
    if (itemQuantity.containsKey(item.id.toString())) {
      item?.itemQuantity[item.id.toString()]++;
    }
    // else add the item to the cart
    else {
      itemQuantity.putIfAbsent(item.id.toString(), () => 1);
      print("else");
      itemQuantity[item.id.toString()] = 1;
      cartItemList.add(item);
    }
  }

  static String getItemQuantity(int index) {
    return CartList.itemQuantity[index.toString()].toString();
  }
}
