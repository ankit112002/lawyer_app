class Crane {
  final String number;
  final String brand;
  final String location;

  Crane({
    required this.number,
    required this.brand,
    required this.location,
  });

  factory Crane.fromJson(Map<String, dynamic> json) {
    return Crane(
      number: json['number'],
      brand: json['brand'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "number": number,
      "brand": brand,
      "location": location,
    };
  }
}
