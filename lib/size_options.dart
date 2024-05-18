import 'package:flutter/material.dart';

class SizeOptions {
  final String name, quantity;
  SizeOptions({required this.name, required this.quantity});
}

List<SizeOptions> sizeOptions = [
  SizeOptions(name: 'Tail', quantity: '12'),
  SizeOptions(name: 'Grande', quantity: '16'),
  SizeOptions(name: 'Venti', quantity: '24'),
  SizeOptions(name: 'Custom', quantity: '...'),
];

class Order extends ChangeNotifier {
  final String name, image;
  final int size;
  final double total;
  Order(
      {required this.name,
      required this.image,
      required this.size,
      required this.total});
  List<Order> get items => items;

  void addToCart(Order cart) {
    items.add(cart);
    notifyListeners();
  }
}
