class Boundaries {
  final String north;
  final String south;
  final String east;
  final String west;

  Boundaries({
    required this.north,
    required this.south,
    required this.east,
    required this.west,
  });

  factory Boundaries.fromJson(Map<String, dynamic> json) {
    return Boundaries(
      north: json['north'],
      south: json['south'],
      east: json['east'],
      west: json['west'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'north': north,
      'south': south,
      'east': east,
      'west': west,
    };
  }
}
