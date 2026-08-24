// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state_management/src/cubit/data/repositories/cart_repository.dart';
// import 'package:state_management/src/cubit/logic/cart_cubit.dart';
// import 'package:state_management/src/cubit/logic/cart_state.dart';
// import 'package:state_management/src/cubit/presentation/screens/my_cart.dart';

// class BlocListenerScreen extends StatelessWidget {
//   const BlocListenerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final products = CartRepository().getAvailableProducts();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurpleAccent,
//         foregroundColor: Colors.white,
//         title: const Text('BLOC LISTENER'),
//       ),
//       body: BlocListener<CartCubit, CartState>(
//         listener: (context, state) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Cart Updated successfully! 🚀'),
//               duration: Duration(milliseconds: 500),
//             ),
//           );
//         },
//         child: BlocBuilder<CartCubit, CartState>(
//           builder: (context, cartState) {
//             return Column(
//               children: [
//                 Text('Total \$ ${cartState.totalPrice.toStringAsFixed(2)}'),
//                 Expanded(
//                   child: ListView(
//                     children: products.map((product) {
//                       return ListTile(
//                         title: Text(product.name),
//                         subtitle: Text(' \$${product.price}'),
//                         trailing: ElevatedButton(
//                           onPressed: () {
//                             context.read<CartCubit>().addItem(product);
//                           },
//                           child: const Text('add to cart bruhh'),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const MyCart()),
//                       );
//                     },
//                     child: const Text('SHOWWWWWWWWW MY CARTTTTT 🛒🛒👖👛👢'),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


