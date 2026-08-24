import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/data/repositories/joke_repo.dart';
import 'package:state_management/src/bloc/logic/event_class.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_state.dart';

class JokeDisplayScreen extends StatelessWidget {
  const JokeDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jokes = JokeRepo().getJokes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text(
          'JOKES JOKES JOKES JOKES',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                final currentJoke = jokes[index];
                final isLiked = state.jokeData.contains(currentJoke);
                return ListTile(
                  title: Text(currentJoke.text),
                  subtitle: Text(currentJoke.subText),
                  trailing: IconButton(
                  
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (isLiked) {
                        context.read<JokeBloc>().add(DislikeTheJokeEvent(currentJoke));
                      } else {
                        context.read<JokeBloc>().add(AddToLikesEvent(currentJoke));
                      }
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
