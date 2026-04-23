import 'package:flutter/material.dart';

class CartItem {
  final Map<String, dynamic> product;
  final String size;
  int quantity;

  CartItem({required this.product, required this.size, this.quantity = 1});
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(0, (sum, item) {
      // Remove any non-numeric/dot characters (like $, LKR, etc.)
      String priceStr = item.product['price'].toString().replaceAll(RegExp(r'[^0-9.]'), '');
      double price = double.tryParse(priceStr) ?? 0.0;
      return sum + (price * item.quantity);
    });
  }

  void addItem(Map<String, dynamic> product, String size) {
    final index = _items.indexWhere((item) => item.product['name'] == product['name'] && item.size == size);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, size: size));
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _items[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
