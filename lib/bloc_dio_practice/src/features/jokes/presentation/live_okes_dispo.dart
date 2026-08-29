import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_bloc.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_event.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/logic/live_joke_state.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/presentation/my_fav_online_jokes.dart';
import 'package:state_management/src/bloc/data/models/joke_data.dart';
import 'package:state_management/src/bloc/logic/joke_bloc.dart';
import 'package:state_management/src/bloc/presentation/screens/my_fav.dart';
class LiveJokeScreen extends StatefulWidget {
  const LiveJokeScreen({super.key});

  @override
  State<LiveJokeScreen> createState() => _LiveJokeScreenState();
}

class _LiveJokeScreenState extends State<LiveJokeScreen> {
  @override
  void initState() {
    super.initState();
    // 🚚 Automatically trigger the Dio web request when the screen starts!
    context.read<NewJokeBloc>().add(LoadOnlineJokes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LIVE SWIPER 🃏'),
        backgroundColor: Colors.amber,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks_rounded, color: Colors.black87),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen2()),
              );
            },
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<NewJokeBloc, LiveJokeState>(
        builder: (context, state) {
          
          // ⏳ FLOW 1: Loading State (Show spinning progress wheel)
          if (state is JokeLoadingState) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.amber),
                  SizedBox(height: 16),
                  Text('Fetching jokes from API...', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          // ❌ FLOW 2: Error State (Show error message + retry button)
          if (state is JokeErrorState) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off_rounded, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      state.errorMessage,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                      onPressed: () => context.read<NewJokeBloc>().add(LoadOnlineJokes()),
                      child: const Text('Retry Connection 🔃', style: TextStyle(color: Colors.black87)),
                    )
                  ],
                ),
              ),
            );
          }

          // ✅ FLOW 3: Loaded State (Show the active joke card)
          if (state is JokeLoadedState) {
            final currentJoke = state.onlineJokes[state.currentJokeIndex];
            final isLiked = state.likedJokes.contains(currentJoke);

            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Joke ${state.currentJokeIndex + 1} of ${state.onlineJokes.length}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            currentJoke.setup,
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            currentJoke.delivery,
                            style: TextStyle(fontSize: 18, color: Colors.grey[700], height: 1.4),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          IconButton(
                            iconSize: 44,
                            icon: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              color: isLiked ? Colors.red : Colors.grey,
                            ),
                            onPressed: () {
                              if (isLiked) {
                                context.read<NewJokeBloc>().add(DislikeTheJokeEvent(currentJoke as LiveJokeData));
                              } else {
                                context.read<NewJokeBloc>().add(AddToLikesEvent(currentJoke as JokeData));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.amber, width: 2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => context.read<NewJokeBloc>().add(PreviousJokeEvent()),
                            child: const Text('⬅️ PREV', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => context.read<NewJokeBloc>().add(NextJokeEvent()),
                            child: const Text('NEXT ➡️', style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
