class Party {
  final String name;
  final String nationality;
  final String idNumber;
  final String civilRegistry;
  final String department;
  final String governorate;

  Party({
    required this.name,
    required this.nationality,
    required this.idNumber,
    required this.civilRegistry,
    required this.department,
    required this.governorate,
  });

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      name: json['name'],
      nationality: json['nationality'],
      idNumber: json['idNumber'],
      civilRegistry: json['civilRegistry'],
      department: json['department'],
      governorate: json['governorate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nationality': nationality,
      'idNumber': idNumber,
      'civilRegistry': civilRegistry,
      'department': department,
      'governorate': governorate,
    };
  }
}
