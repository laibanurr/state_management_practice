import 'package:state_management/src/bloc/data/models/joke_data.dart';

abstract class JokeEvent {}

class AddToLikesEvent extends JokeEvent {
  final JokeData jokeData;
  AddToLikesEvent(this.jokeData);
}

class DislikeTheJokeEvent extends JokeEvent {
  final JokeData jokeData;
  DislikeTheJokeEvent(this.jokeData);
}
class NextJokeEvent extends JokeEvent{}
class PrevJokeEvent extends JokeEvent{}
