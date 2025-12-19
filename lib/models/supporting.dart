class Party {
  final String fullName;
  final String nationality;
  final String address;
  final String department;
  final String governorate;
  final String familyId;
  final String civilRegistry;

  Party({
    required this.fullName,
    required this.nationality,
    required this.address,
    required this.department,
    required this.governorate,
    required this.familyId,
    required this.civilRegistry,
  });

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "nationality": nationality,
    "address": address,
    "department": department,
    "governorate": governorate,
    "familyId": familyId,
    "civilRegistry": civilRegistry,
  };
}
