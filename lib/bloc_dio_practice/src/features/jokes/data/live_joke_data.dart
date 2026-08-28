import 'dart:convert';

class LiveJokeData {
  final String setup;
  final String delivery;
  LiveJokeData({
    required this.setup,
    required this.delivery,
  });

  LiveJokeData copyWith({
    String? setup,
    String? delivery,
  }) {
    return LiveJokeData(
      setup: setup ?? this.setup,
      delivery: delivery ?? this.delivery,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setup': setup,
      'delivery': delivery,
    };
  }

  factory LiveJokeData.fromMap(Map<String, dynamic> map) {
    return LiveJokeData(
      setup: map['setup'] as String,
      delivery: map['delivery'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveJokeData.fromJson(String source) => LiveJokeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LiveJokeData(setup: $setup, delivery: $delivery)';

  @override
  bool operator ==(covariant LiveJokeData other) {
    if (identical(this, other)) return true;
  
    return 
      other.setup == setup &&
      other.delivery == delivery;
  }

  @override
  int get hashCode => setup.hashCode ^ delivery.hashCode;
}
