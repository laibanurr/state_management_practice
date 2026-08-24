import 'package:state_management/src/bloc/data/models/joke_data.dart';

class JokeRepo {
  List<JokeData> getJokes() {
    return [
      JokeData(
        text: 'Morning Alarm',
        subText: 'I told my wife she was drawing her eyebrows too high. She looked surprised.',
      ),
      JokeData(
        text: 'The Wealthy Musician',
        subText: 'What concert only costs 45 cents? 50 Cent featuring Nickelback.',
      ),
      JokeData(
        text: 'Private Thoughts',
        subText: 'The guy who stole my diary just went missing. My thoughts are with his family.',
      ),
      JokeData(
        text: 'Spicy Vegetables',
        subText: 'What does a nosy pepper do? It gets jalapeño business.',
      ),
      JokeData(
        text: 'Suspicious Steps',
        subText: "I don't trust stairs. They're always up to something.",
      ),
      JokeData(
        text: 'Divine Transportation',
        subText: 'What car does Jesus drive? A Christler.',
      ),
      JokeData(
        text: 'Summer Heat',
        subText: 'It was so hot today I almost called my ex just to be around something shady.',
      ),
      JokeData(
        text: 'Office Management',
        subText: 'What do you call a person with a briefcase sitting in a tree? A branch manager.',
      ),
      JokeData(
        text: 'Reading Material',
        subText: "I am reading a book on anti-gravity. I just can't put it down.",
      ),
      JokeData(
        text: 'Classic Symptoms',
        subText: '"Doc, I can\'t stop singing Tom Jones songs." "That sounds like Tom Jones syndrome." "Is it common?" "It\'s not unusual."',
      ),
    ];
  }
}
