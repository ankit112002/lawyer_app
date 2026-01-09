import 'package:lawyer/models/payment.dart';

import 'crane.dart';
import 'moveble_lease_second_party.dart';
import 'moveble_party.dart';

class CraneContractModel {
  final String date;
  final Party firstParty;
  final SecondParty secondParty;
  final Crane crane;
  final Payment payment;
  final String courts;
  final List<String> equipmentList;
  final bool useAlternativeArticle7;
  final String additionalNotes;

  CraneContractModel({
    required this.date,
    required this.firstParty,
    required this.secondParty,
    required this.crane,
    required this.payment,
    required this.courts,
    required this.equipmentList,
    required this.useAlternativeArticle7,
    required this.additionalNotes,
  });

  factory CraneContractModel.fromJson(Map<String, dynamic> json) {
    return CraneContractModel(
      date: json['date'],
      firstParty: Party.fromJson(json['firstParty']),
      secondParty: SecondParty.fromJson(json['secondParty']),
      crane: Crane.fromJson(json['crane']),
      payment: Payment.fromJson(json['payment']),
      courts: json['courts'],
      equipmentList: List<String>.from(json['equipmentList']),
      useAlternativeArticle7: json['useAlternativeArticle7'],
      additionalNotes: json['additionalNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "firstParty": firstParty.toJson(),
      "secondParty": secondParty.toJson(),
      "crane": crane.toJson(),
      "payment": payment.toJson(),
      "courts": courts,
      "equipmentList": equipmentList,
      "useAlternativeArticle7": useAlternativeArticle7,
      "additionalNotes": additionalNotes,
    };
  }
}
