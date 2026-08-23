import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/logic/cart_cubit.dart';
import 'package:state_management/src/cubit/logic/cart_state.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text(
          'HAHAHAHAH MYYY CARTTTTTT 🙏🙄😭😭',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, cartState) {
          if (cartState.items.isEmpty) {
            return const Center(child: Text('Your cart is empty!'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartState.items.length,
                  itemBuilder: (context, index) {
                    final myItem = cartState.items[index];
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
      ),
    );
  }
}
