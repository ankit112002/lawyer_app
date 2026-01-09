class Party {
  final String fullName;
  final String profession;
  final String nationality;
  final String birthDate;
  final String idProof;
  final String residence;

  Party({
    required this.fullName,
    required this.profession,
    required this.nationality,
    required this.birthDate,
    required this.idProof,
    required this.residence,
  });

  factory Party.fromJson(Map<String, dynamic> json) => Party(
    fullName: json['fullName'],
    profession: json['profession'],
    nationality: json['nationality'],
    birthDate: json['birthDate'],
    idProof: json['idProof'],
    residence: json['residence'],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "profession": profession,
    "nationality": nationality,
    "birthDate": birthDate,
    "idProof": idProof,
    "residence": residence,
  };
}

class ShareTable {
  final String name;
  final String nationality;
  final int cash;
  final int inKind;
  final String percentage;

  ShareTable({
    required this.name,
    required this.nationality,
    required this.cash,
    required this.inKind,
    required this.percentage,
  });

  factory ShareTable.fromJson(Map<String, dynamic> json) => ShareTable(
    name: json['name'],
    nationality: json['nationality'],
    cash: json['cash'],
    inKind: json['inKind'],
    percentage: json['percentage'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "nationality": nationality,
    "cash": cash,
    "inKind": inKind,
    "percentage": percentage,
  };
}

class InKindContribution {
  final String partnerName;
  final String description;

  InKindContribution({
    required this.partnerName,
    required this.description,
  });

  factory InKindContribution.fromJson(Map<String, dynamic> json) =>
      InKindContribution(
        partnerName: json['partnerName'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
    "partnerName": partnerName,
    "description": description,
  };
}

class Manager {
  final String fullName;
  final String residence;

  Manager({required this.fullName, required this.residence});

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
    fullName: json['fullName'],
    residence: json['residence'],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "residence": residence,
  };
}

class SupervisionMember {
  final String fullName;
  final String residence;

  SupervisionMember({required this.fullName, required this.residence});

  factory SupervisionMember.fromJson(Map<String, dynamic> json) =>
      SupervisionMember(
        fullName: json['fullName'],
        residence: json['residence'],
      );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "residence": residence,
  };
}

class Auditor {
  final String fullName;
  final String residence;

  Auditor({
    required this.fullName,
    required this.residence,
  });

  factory Auditor.fromJson(Map<String, dynamic> json) => Auditor(
    fullName: json['fullName'],
    residence: json['residence'],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "residence": residence,
  };
}

