// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:state_management/src/cubit/hydrated_cubit/cart_cubit_02.dart';
// import 'package:state_management/src/cubit/hydrated_cubit/screens/cart_cubit_screen_02.dart';

// void main() async {
//   // 1. Ensure Flutter binding is initialized
//   WidgetsFlutterBinding.ensureInitialized();

//   // 2. Get the application storage directory
//   final Directory directory = await getApplicationDocumentsDirectory();

//   // 3. Initialize and assign storage globally to HydratedBloc
//   HydratedBloc.storage = await HydratedStorage.build(
//     storageDirectory: HydratedStorageDirectory(directory.path),
//   );

//   // 4. Run the app
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CartCubit2>(
//       create: (context) => CartCubit2(),
//       child: MaterialApp(
//         title: 'StateMANAGEMENT',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         ),
//         home: const CartScreenCubit(),
//       ),
//     );
//   }
// }

//BLOC 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/presentation/screens/joke_dispo_screen.dart'; // Import your new Bloc

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokeBloc>(
      // 1. Initialize your JokeBloc here so the entire app can access it
      create: (context) => JokeBloc(),
      child: MaterialApp(
        title: 'Joke BLoC App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        // 2. Set your joke listing screen as the home page
        home: const JokeDisplayScreen()
      ),
    );
  }
}


