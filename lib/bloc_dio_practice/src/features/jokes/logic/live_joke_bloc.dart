import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/repositories/live_joke_repository.dart';
import 'live_joke_event.dart';
import 'live_joke_state.dart';

class NewJokeBloc extends Bloc<LiveJokeEvent, LiveJokeState> {
  // Inject your isolated repository dependency right here
  final LiveJokeRepository _apiRepository = LiveJokeRepository();

  // Initialize the BLoC with the default Loading state
  NewJokeBloc() : super(JokeLoadingState()) {
    
    // 🌐 1. Handles downloading fresh jokes from the internet
    on<LoadOnlineJokes>((event, emit) async {
      emit(JokeLoadingState()); // Instantly forces the UI to show the spinning wheel
      try {
        // Calls your Dio method inside the repository
        final jokesFromServer = await _apiRepository.fetchOnlineJokes();
        
        // Emits success state carrying the fresh web jokes array list
        emit(JokeLoadedState(onlineJokes: jokesFromServer)); 
      } catch (e) {
        // If internet fails or server errors out, emit the error state layout
        emit(JokeErrorState(e.toString())); 
      }
    });

    // ❤️ 2. Handles adding a joke to the liked storage warehouse
    on<AddToLikesEvent>((event, emit) {
      if (state is JokeLoadedState) {
        final currentState = state as JokeLoadedState;
        
        // Only append if it's not already inside the array to prevent duplicate entries
        if (!currentState.likedJokes.contains(event.jokeData)) {
          emit(currentState.copyWith(
            likedJokes: [
              ...currentState.likedJokes,
              event.jokeData as LiveJokeData,
            ],
          ));
        }
      }
    });

    // 🗑️ 3. Handles removing a joke from the favorites selection list
    on<DislikeTheJokeEvent>((event, emit) {
      if (state is JokeLoadedState) {
        final currentState = state as JokeLoadedState;
        
        emit(currentState.copyWith(
          likedJokes: currentState.likedJokes.where((j) => j != event.jokeData).toList(),
        ));
      }
    });

    // ➡️ 4. Handles forward swiper card navigation modulo formulas
    on<NextJokeEvent>((event, emit) {
      if (state is JokeLoadedState) {
        final currentState = state as JokeLoadedState;
        
        final nextIdx = (currentState.currentJokeIndex + 1) % currentState.onlineJokes.length;
        
        emit(currentState.copyWith(currentJokeIndex: nextIdx));
      }
    });

    // ⬅️ 5. Handles backward swiper card navigation modulo formulas
    on<PreviousJokeEvent>((event, emit) {
      if (state is JokeLoadedState) {
        final currentState = state as JokeLoadedState;
        
        final prevIdx = (currentState.currentJokeIndex - 1 + currentState.onlineJokes.length) % currentState.onlineJokes.length;
        
        emit(currentState.copyWith(currentJokeIndex: prevIdx));
      }
    });
  }
}
