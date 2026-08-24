// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart'; // 1. Add this import!

// 2. Add 'extends Equatable' to your class definition
class CartItemEquatable extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final double price;

  // 3. Make the constructor 'const' (this makes Flutter even faster!)
  const CartItemEquatable({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  CartItemEquatable copyWith({
    String? id,
    String? name,
    int? quantity,
    double? price,
  }) {
    return CartItemEquatable(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  factory CartItemEquatable.fromMap(Map<String, dynamic> map) {
    return CartItemEquatable(
      id: map['id'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: (map['price'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemEquatable.fromJson(String source) => CartItemEquatable.fromMap(json.decode(source) as Map<String, dynamic>);

  // 4. This replaces ALL the custom '==' and 'hashCode' methods!
  // Just tell Equatable exactly which fields it should look at to see if an item changed.
  @override
  List<Object?> get props => [id, name, quantity, price];
}
