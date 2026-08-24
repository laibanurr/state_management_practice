import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/hydrated_cubit/cart_cubit_02.dart';
import '../../hydrated_cubit/cart_state_hydrated_02.dart';

class MyCartConsumerScreen03 extends StatelessWidget {
  const MyCartConsumerScreen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: const Text(
          'MY CART',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: () => context.read<CartCubit2>().clearCart(),
          )
        ],
      ),
      body: BlocConsumer<CartCubit2, CartState2>(
        listener: (context, state) {
          if (state.items.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your cart is empty! 🛍️')),
            );
          }
        },
        builder: (context, cartState) {
          final items = cartState.items;

          if (items.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final myItem = items[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Text('${myItem.quantity}', style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(myItem.name),
                      subtitle: Text('\$${myItem.price.toStringAsFixed(2)} each'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${(myItem.quantity * myItem.price).toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              context.read<CartCubit2>().removeItem(myItem.id);
                            },
                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}