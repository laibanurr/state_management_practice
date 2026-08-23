import 'package:state_management/src/cubit/data/models/cart_item.dart';

class CartState {
  final List<CartItem> items;
  CartState({this.items = const []});
  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.total);
}