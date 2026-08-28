import 'package:state_management/bloc_dio_practice/src/features/jokes/data/live_joke_data.dart';
import 'package:state_management/src/bloc/data/models/joke_data.dart';

abstract class LiveJokeEvent {}

class LoadOnlineJokes extends LiveJokeEvent {}

class AddToLikesEvent extends LiveJokeEvent {
  final JokeData jokeData;
  AddToLikesEvent(this.jokeData);
}
class DislikeTheJokeEvent extends LiveJokeEvent {
  final LiveJokeData jokeData; // Carries the specific joke click payload 🚚
  DislikeTheJokeEvent(this.jokeData);
}

// 4. Fired when clicking the NEXT button
class NextJokeEvent extends LiveJokeEvent {}

// 5. Fired when clicking the PREV button
class PreviousJokeEvent extends LiveJokeEvent {}
