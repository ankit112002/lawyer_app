class Party {
  final String name;
  final String address;
  final String governorate;
  final String familyCardNumber;
  final String civilRegistry;

  Party({
    required this.name,
    required this.address,
    required this.governorate,
    required this.familyCardNumber,
    required this.civilRegistry,
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      name: json['name'],
      address: json['address'],
      governorate: json['governorate'],
      familyCardNumber: json['familyCardNumber'],
      civilRegistry: json['civilRegistry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "governorate": governorate,
      "familyCardNumber": familyCardNumber,
      "civilRegistry": civilRegistry,
    };
  }
}
