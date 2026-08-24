import 'package:state_management/src/bloc/data/models/joke_data.dart';

class JokeState {
  final List<JokeData> jokeData;
  JokeState({this.jokeData = const []});
  JokeState copyWith({List<JokeData>? jokeData}) {
    return JokeState(jokeData: jokeData ?? this.jokeData);
  }
}
