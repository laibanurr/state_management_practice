import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_state.dart';
import 'package:state_management/src/bloc/logic/event_class.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY FAVORITES ❤️'),
        backgroundColor: Colors.amber,
      ),
      // 1. Listen to the same JokeBloc instance
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state) {
          // If the liked jokes list is empty, show a nice message
          if (state.jokeData.isEmpty) {
            return const Center(
              child: Text(
                'No favorite jokes yet! Go like some! 🥺',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // 2. Render all liked jokes from the state warehouse list
          return ListView.builder(
            itemCount: state.jokeData.length,
            itemBuilder: (context, index) {
              final favoriteJoke = state.jokeData[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    favoriteJoke.text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(favoriteJoke.subText),
                  // 3. Add a delete button to unlike directly from this screen
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      context.read<JokeBloc>().add(DislikeTheJokeEvent(favoriteJoke));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
