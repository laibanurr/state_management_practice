import 'package:state_management/src/cubit/data/models/cart_item.dart';

class CartRepository {
  // Pretend this is a fixed catalog you can "add" from —
  // stands in for what would later be a real API/database call.
  List<CartItem> getAvailableProducts() {
    return [
      CartItem(id: 'p1', name: 'Shoes', price: 49.99),
      CartItem(id: 'p2', name: 'Bags', price: 29.99),
      CartItem(id: 'p3', name: 'Jewelry', price: 15.00),
    ];
  }
}