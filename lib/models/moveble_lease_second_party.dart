class SecondParty {
  final String name;
  final String department;
  final String jobPlace;
  final String familyCardNumber;
  final String civilRegistry;

  SecondParty({
    required this.name,
    required this.department,
    required this.jobPlace,
    required this.familyCardNumber,
    required this.civilRegistry,
  });

  factory SecondParty.fromJson(Map<String, dynamic> json) {
    return SecondParty(
      name: json['name'],
      department: json['department'],
      jobPlace: json['jobPlace'],
      familyCardNumber: json['familyCardNumber'],
      civilRegistry: json['civilRegistry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "department": department,
      "jobPlace": jobPlace,
      "familyCardNumber": familyCardNumber,
      "civilRegistry": civilRegistry,
    };
  }
}
