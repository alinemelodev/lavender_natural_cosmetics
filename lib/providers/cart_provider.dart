import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(String id, String title, String price, String image) {
    final existingProductIndex = _items.indexWhere((item) => item['id'] == id);

    if (existingProductIndex >= 0) {
      _items[existingProductIndex]['quantity']++;
    } else {
      _items.add({
        'id': id,
        'title': title,
        'price': price,
        'image': image,
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    final productIndex = _items.indexWhere((item) => item['id'] == id);
    if (productIndex >= 0) {
      _items[productIndex]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0.0,
        (sum, item) => sum + double.parse(item['price']) * item['quantity']);
  }

  bool get isEmpty {
    return _items.isEmpty;
  }
}
