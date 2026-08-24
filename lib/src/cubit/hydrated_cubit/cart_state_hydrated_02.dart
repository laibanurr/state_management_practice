import 'dart:convert';
import 'package:state_management/src/cubit/hydrated_cubit/cart_item_02.dart';

class CartState2 {
  final List<CartItem2> items;
  
  CartState2({
    this.items = const [],
  });

  double get totalPrice => items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  CartState2 copyWith({
    List<CartItem2>? items,
  }) {
    return CartState2(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CartState2.fromMap(Map<String, dynamic> map) {
    return CartState2(
      items: List<CartItem2>.from(
        (map['items'] as List<dynamic>? ?? []).map<CartItem2>(
          (x) => CartItem2.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState2.fromJson(String source) => CartState2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CartState2(items: $items)';

  @override
  bool operator ==(covariant CartState2 other) {
    if (identical(this, other)) return true;
    if (other.items.length != items.length) return false;

    for (var index = 0; index < items.length; index++) {
      if (other.items[index] != items[index]) return false;
    }

    return true;
  }

  @override
  int get hashCode => items.hashCode;
}