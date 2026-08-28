import 'package:equatable/equatable.dart';
import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';

abstract class LiveJokeState extends Equatable {
  const LiveJokeState();
  @override
  List<Object?> get props => [];
}

class JokeLoadingState extends LiveJokeState {}

class JokeLoadedState extends LiveJokeState {
  final List<LiveJokeData> onlineJokes;
  final List<LiveJokeData> likedJokes;
  final int currentJokeIndex;

  const JokeLoadedState({
    required this.onlineJokes,
    this.likedJokes = const [],
    this.currentJokeIndex = 0,
  });

  JokeLoadedState copyWith({
    List<LiveJokeData>? onlineJokes,
    List<LiveJokeData>? likedJokes,
    int? currentJokeIndex,
  }) {
    return JokeLoadedState(
      onlineJokes: onlineJokes ?? this.onlineJokes,
      likedJokes: likedJokes ?? this.likedJokes,
      currentJokeIndex: currentJokeIndex ?? this.currentJokeIndex,
    );
  }

  @override
  List<Object?> get props => [onlineJokes, likedJokes, currentJokeIndex];
}

class JokeErrorState extends LiveJokeState {
  final String errorMessage;
 const JokeErrorState(this.errorMessage);
}
