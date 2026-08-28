// home_tabs_screen.dart
// A screen using BOTH JokeBloc and CartBloc simultaneously —
// this is the actual payoff of MultiBlocProvider: no re-wrapping,
// no re-declaring, both are just... available.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/data/repositories/joke_repo.dart';
import 'package:state_management/src/bloc/logic/event_class.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_state.dart';
import 'package:state_management/src/cubit/data/repositories/cart_repository.dart';
import 'package:state_management/src/cubit/logic/cart_cubit.dart';
import 'package:state_management/src/cubit/logic/cart_state.dart';

class HomeTabsScreen extends StatelessWidget {
  const HomeTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes + Cart (MultiBlocProvider demo)'),
        actions: [
          // Reading CartCubit's state, purely for a small badge —
          // proves CartCubit is reachable here even though this
          // AppBar has nothing to do with the cart screen itself.
          BlocBuilder<CartCubit, CartState>(
            builder: (context, cartState) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: Text('🛒 ${cartState.items.length}')),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, jokeState) {
          final allJokes = JokeRepo()
              .getJokes(); // or wherever your joke list comes from
          final currentJoke = allJokes[jokeState.currentJokeIndex];
          final isLiked = jokeState.jokeData.contains(currentJoke);
          final List cartItemsList = CartRepository().getAvailableProducts();
          final demoCartItem = cartItemsList[0];

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentJoke.text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(currentJoke.subText),
                const SizedBox(height: 12),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    if (isLiked) {
                      context.read<JokeBloc>().add(
                        DislikeTheJokeEvent(currentJoke),
                      );
                    } else {
                      context.read<JokeBloc>().add(
                        AddToLikesEvent(currentJoke),
                      );
                    }
                  },
                ),
                Text('Liked jokes so far: ${jokeState.jokeData.length}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      context.read<JokeBloc>().add(NextJokeEvent()),
                  child: const Text('Next Joke'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () =>
                      context.read<CartCubit>().addItem(demoCartItem),
                  child: const Text('Add Demo Item to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
