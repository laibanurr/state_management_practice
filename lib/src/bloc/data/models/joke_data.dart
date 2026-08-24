// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JokeData {
  final String text;
  final String subText;
  JokeData({
    required this.text,
    required this.subText,
  });

  JokeData copyWith({
    String? text,
    String? subText,
  }) {
    return JokeData(
      text: text ?? this.text,
      subText: subText ?? this.subText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'subText': subText,
    };
  }

  factory JokeData.fromMap(Map<String, dynamic> map) {
    return JokeData(
      text: map['text'] as String,
      subText: map['subText'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeData.fromJson(String source) => JokeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JokeData(text: $text, subText: $subText)';

  @override
  bool operator ==(covariant JokeData other) {
    if (identical(this, other)) return true;
  
    return 
      other.text == text &&
      other.subText == subText;
  }

  @override
  int get hashCode => text.hashCode ^ subText.hashCode;
}
