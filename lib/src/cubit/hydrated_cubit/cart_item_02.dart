import 'dart:convert';

class CartItem2 {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem2({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  CartItem2 copyWith({
    String? id,
    String? name,
    int? quantity,
    double? price,
  }) {
    return CartItem2(
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

  factory CartItem2.fromMap(Map<String, dynamic> map) {
    return CartItem2(
      id: map['id'] as String,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      price: (map['price'] as num).toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem2.fromJson(String source) => CartItem2.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartItem2(id: $id, name: $name, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(covariant CartItem2 other) {
    if (identical(this, other)) return true;
    return other.id == id && other.name == name && other.quantity == quantity && other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ quantity.hashCode ^ price.hashCode;
  }
}