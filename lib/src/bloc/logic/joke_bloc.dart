import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/data/models/joke_data.dart';
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
      emit(state.copyWith(
        jokeData: state.jokeData
            .where((joke) => joke != event.jokeData)
            .toList(),
      ));
    });
  }
}
