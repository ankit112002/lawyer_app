class Dimensions {
  final String lengthNorth;
  final String lengthSouth;
  final String lengthEast;
  final String lengthWest;

  Dimensions({
    required this.lengthNorth,
    required this.lengthSouth,
    required this.lengthEast,
    required this.lengthWest,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      lengthNorth: json['lengthNorth'],
      lengthSouth: json['lengthSouth'],
      lengthEast: json['lengthEast'],
      lengthWest: json['lengthWest'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lengthNorth': lengthNorth,
      'lengthSouth': lengthSouth,
      'lengthEast': lengthEast,
      'lengthWest': lengthWest,
    };
  }
}
