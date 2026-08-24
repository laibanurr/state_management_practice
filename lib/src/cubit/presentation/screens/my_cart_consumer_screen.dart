import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/logic/cart_cubit.dart';
// 1. Added the missing import for CartState!
import 'package:state_management/src/cubit/logic/cart_state.dart'; 

class MyCartConsumerScreen extends StatelessWidget {
  const MyCartConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'HAHAHAHAH MYYY CARTTTTTT 🙏🙄😭😭',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        // 2. Added the mandatory listener function for BlocConsumer
        listener: (context, state) {
          if (state.items.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your cart is completely empty now! 🛍️')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Item updated! 🤝'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        // 3. Cleaned up the builder parameter null checks
        builder: (context, cartState) {
          final items = cartState.items; // No need for '?' since cartState is never null

          if (items.isEmpty) {
            return const Center(child: Text('Your cart is empty!'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final myItem = items[index];
                    return ListTile(
                      leading: Text(myItem.name),
                      subtitle: Text('Qty: ${myItem.quantity}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${myItem.total.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              context.read<CartCubit>().removeItem(myItem.id);
                            },
                            icon: const Icon(Icons.delete_forever),
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
      ), // Added missing closing parenthesis for BlocConsumer
    );
  }
}
