import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/cubit/logic/cart_cubit.dart';
import 'package:state_management/src/cubit/presentation/screens/bloc_listener_screen.dart';
import 'package:state_management/src/cubit/presentation/screens/cart_screen_cubit.dart';

void main() {
  runApp(
    // Wrapping the whole app ensures MyCart can see the same CartCubit instance!
    BlocProvider(
      create: (context) => CartCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateMANAGEMENT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Fixed the missing 'ColorScheme' keyword typo here
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BlocListenerScreen(),
    );
  }
}
