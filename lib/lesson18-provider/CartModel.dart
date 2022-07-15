import 'package:flutter/foundation.dart';

class CartModel  {

  /// Cart Items
  final List<CartItem> items = [];
  final List<CartItem> deletedItems = [];

  /// The current total price of all items.
  double get totalPrice =>
      items.fold<double>(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(CartItem item) {
    items.add(item);
    // TODO trigger action
  }

  void remove(CartItem item) {
    items.remove(item);
    deletedItems.add(item);
    // TODO trigger action
  }

  void getProductList(CartItem item) {
    items.add(CartItem("Mac book Air", 2500));
    items.add(CartItem("Air pods", 15));
    items.add(CartItem("headset", 200));
    items.add(CartItem("Smart watch", 60));
    items.add(CartItem("Action figure", 100));
  }
  void addMoreItems(CartItem item) {
    items.expand((element) => [element,element]);
  }
}

class CartItem{
  String productName;
  double price;
  CartItem(this.productName, this.price);
}