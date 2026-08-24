import 'dart:convert';
import 'package:equatable/equatable.dart'; // 1. Add this import!
import 'package:state_management/src/cubit/equatable/model_classes/cart_item_equatable.dart';

// 2. Add 'extends Equatable' here too
class CartEquatableState extends Equatable {
  final List<CartItemEquatable> items;
  
  const CartEquatableState({
    this.items = const [],
  });

  double get totalPrice => items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  CartEquatableState copyWith({
    List<CartItemEquatable>? items,
  }) {
    return CartEquatableState(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory CartEquatableState.fromMap(Map<String, dynamic> map) {
    return CartEquatableState(
      items: List<CartItemEquatable>.from(
        (map['items'] as List<dynamic>? ?? []).map<CartItemEquatable>(
          (x) => CartItemEquatable.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartEquatableState.fromJson(String source) => CartEquatableState.fromMap(json.decode(source) as Map<String, dynamic>);

  // 3. Tell Equatable to check the list of items
  @override
  List<Object?> get props => [items];
}
