import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_bloc.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_event.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_state.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SAVED JOKES ❤️'),
        backgroundColor: Colors.amber,
      ),
      body: BlocBuilder<NewJokeBloc, LiveJokeState>(
        builder: (context, state) {
          
          // 🛡️ Safety check: We only render data if the state is active and loaded
          if (state is JokeLoadedState) {
            
            if (state.likedJokes.isEmpty) {
              return const Center(
                child: Text(
                  'No favorite jokes yet! Go like some! 🥺',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            return ListView.builder(
              itemCount: state.likedJokes.length,
              itemBuilder: (context, index) {
                final favoriteJoke = state.likedJokes[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      favoriteJoke.setup,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(favoriteJoke.delivery),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () {
                        // 🗑️ Reuses your filter logic method event package instantly!
                        context.read<NewJokeBloc>().add(DislikeTheJokeEvent(favoriteJoke));
                      },
                    ),
                  ),
                );
              },
            );
          }

          // Fallback if data hasn't finished downloading yet
          return const Center(child: CircularProgressIndicator(color: Colors.amber));
        },
      ),
    );
  }
}
