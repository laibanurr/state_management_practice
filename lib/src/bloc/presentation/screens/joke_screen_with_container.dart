import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/data/repositories/joke_repo.dart';
import 'package:state_management/src/bloc/logic/event_class.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/logic/joke_state.dart';
import 'package:state_management/src/bloc/presentation/screens/my_fav.dart';

class JokeScreenWithContainer extends StatelessWidget {
  const JokeScreenWithContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final allJokes = JokeRepo().getJokes();
    return Scaffold(
      appBar: AppBar(
  title: const Text('JOKE SWIPER 🃏'),
  backgroundColor: Colors.amber,
  centerTitle: true,
    actions: [
    // NEW: Navigation icon button to see favorites
    IconButton(
      icon: const Icon(Icons.bookmark_added, color: Colors.black87),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FavoritesScreen()),
        );
      },
    ),
  ],
),


      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state){
          final currentJoke = allJokes[state.currentJokeIndex];
          final isLiked = state.jokeData.contains(currentJoke);
           return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. The Main Joke Display Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                       children: [
                        Text(
                          currentJoke.text,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          currentJoke.subText,
                          style: const TextStyle(fontSize: 18, color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                         IconButton(
                          iconSize: 40,
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<JokeBloc>().add(PrevJokeEvent());
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Previous'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<JokeBloc>().add(NextJokeEvent());
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

