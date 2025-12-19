class Notarization {
  final String office;
  final String recordNumber;
  final String year;
  final String dayOfMonth;
  final String dateFormatted;
  final String notaryName;
  final PartySigner firstSigner;
  final PartySigner secondSigner;

  Notarization({
    required this.office,
    required this.recordNumber,
    required this.year,
    required this.dayOfMonth,
    required this.dateFormatted,
    required this.notaryName,
    required this.firstSigner,
    required this.secondSigner,
  });

  Map<String, dynamic> toJson() => {
    "office": office,
    "recordNumber": recordNumber,
    "year": year,
    "dayOfMonth": dayOfMonth,
    "dateFormatted": dateFormatted,
    "notaryName": notaryName,
    "firstSigner": firstSigner.toJson(),
    "secondSigner": secondSigner.toJson(),
  };
}

class PartySigner {
  final String name;
  final String familyId;
  final String civilRegistry;

  PartySigner({
    required this.name,
    required this.familyId,
    required this.civilRegistry,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "familyId": familyId,
    "civilRegistry": civilRegistry,
  };
}
