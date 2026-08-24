import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/hydrated_cubit/cart_cubit_02.dart';
import 'package:state_management/src/cubit/hydrated_cubit/screens/my_cart_03.dart';
import '../../data/repositories/cart_repository.dart';
import '../../hydrated_cubit/cart_item_02.dart'; 
import '../../hydrated_cubit/cart_state_hydrated_02.dart'; 

class CartScreenCubit extends StatelessWidget {
  const CartScreenCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final products = CartRepository().getAvailableProducts();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('CART PRODUCTS'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          BlocSelector<CartCubit2, CartState2, double>(
            selector: (state) => state.totalPrice,
            builder: (context, totalPrice) {
              return Text(
                'Total \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              );
            },
          ),
          Expanded(
            child: ListView(
              children: products.map((product) {
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(' \$${product.price}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      final itemToAdd = CartItem2(
                        id: product.id.toString(), 
                        name: product.name,
                        quantity: 1,
                        price: product.price,
                      );
                      context.read<CartCubit2>().addItem(itemToAdd);
                    },
                    child: const Text('Add to cart'),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCartConsumerScreen03()),
                );
              },
              child: const Text('SHOW MY CART 🛒'),
            ),
          ),
        ],
      ),
    );
  }
}