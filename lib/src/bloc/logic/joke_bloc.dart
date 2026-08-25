import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/data/repositories/joke_repo.dart';
import 'package:state_management/src/bloc/logic/event_class.dart';
import 'package:state_management/src/bloc/logic/joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  JokeBloc() : super(JokeState()) {
    on<AddToLikesEvent>(((event, emit) {
      final alreadyLiked = state.jokeData.contains(event.jokeData);
      if (!alreadyLiked) {
        emit(state.copyWith(jokeData: [...state.jokeData, event.jokeData]));
      }
    }));
    on<DislikeTheJokeEvent>((event, emit) {
      emit(
        state.copyWith(
          jokeData: state.jokeData
              .where((joke) => joke != event.jokeData)
              .toList(),
        ),
      );
    });
    on<NextJokeEvent>((event, emit) {
      final totalJokeCount = JokeRepo().getJokes().length;
      final nextIndex = (state.currentJokeIndex + 1) % totalJokeCount;
      emit(state.copyWith(currentJokeIndex: nextIndex));
    });

    on<PrevJokeEvent>((event, emit) {
      final totalJokeCount = JokeRepo().getJokes().length;
      final prevIndex =
          (state.currentJokeIndex - 1 + totalJokeCount) % totalJokeCount;
      emit(state.copyWith(currentJokeIndex: prevIndex));
    });
  }
}
