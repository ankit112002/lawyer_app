import 'package:lawyer/models/supporting.dart';
import 'package:lawyer/models/vehicle.dart';

import 'notorization.dart';

class CarLeasePdfRequest {
  final String date;

  final Party firstParty;
  final Party secondParty;

  final Vehicle vehicle;

  final String price;
  final String priceWords;

  final Notarization notarization;

  CarLeasePdfRequest({
    required this.date,
    required this.firstParty,
    required this.secondParty,
    required this.vehicle,
    required this.price,
    required this.priceWords,
    required this.notarization,
  });

  Map<String, dynamic> toJson() => {
    "contractDate": date,
    "parties": [
      firstParty.toJson(),
      secondParty.toJson(),
    ],
    "vehicle": vehicle.toJson(),
    "price": price,
    "priceWords": priceWords,
    "notarization": notarization.toJson(),
    "notes": "Additional notes if applicable.",
  };
}
