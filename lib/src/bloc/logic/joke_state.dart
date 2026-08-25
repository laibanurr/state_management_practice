import 'package:state_management/src/bloc/data/models/joke_data.dart';

class JokeState {
  final List<JokeData> jokeData;
  final int  currentJokeIndex;
  JokeState({this.jokeData = const [],
  this.currentJokeIndex=0});
  JokeState copyWith({List<JokeData>? jokeData , int? currentJokeIndex}) {
    return JokeState(jokeData: jokeData ?? this.jokeData,
    currentJokeIndex: currentJokeIndex?? this.currentJokeIndex,
     );
  }
}
