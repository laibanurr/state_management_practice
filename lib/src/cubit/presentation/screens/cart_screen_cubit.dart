// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state_management/src/cubit/data/repositories/cart_repository.dart';
// import 'package:state_management/src/cubit/logic/cart_cubit.dart';
// import 'package:state_management/src/cubit/logic/cart_state.dart';
// import 'package:state_management/src/cubit/presentation/screens/my_cart_consumer_screen.dart';

// class CartScreenCubit extends StatelessWidget {
//   const CartScreenCubit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final products = CartRepository().getAvailableProducts();
//     return Scaffold(
//       appBar: AppBar(title: Text('CART PRODUCTSSSSSSSSSSSSSS')),
//       body: BlocBuilder<CartCubit, CartState>(
//         builder: (BuildContext context, cartState) {

//           return Column(
//             children: [
//               BlocSelector<CartCubit, CartState, double>(
//                 selector: (state) => state.totalPrice,
//                 builder: (context, totalPrice) {
//                   return Text(
//                     'Total \$ ${cartState.totalPrice.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   );
//                 },
//               ),
//               Expanded(
//                 child: ListView(
//                   children: products.map((product) {
//                     return ListTile(
//                       title: Text(product.name),
//                       subtitle: Text(' \$${product.price}'),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           context.read<CartCubit>().addItem(product);
//                         },
//                         child: Text('add to cart bruhh'),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MyCartConsumerScreen(),
//                       ),
//                     );
//                   },
//                   child: Text('SHOWWWWWWWWW MY CARTTTTT 🛒🛒👖👛👢'),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
