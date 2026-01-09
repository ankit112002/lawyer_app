import 'package:lawyer/models/party.dart';

import 'boundary.dart';
import 'customfields.dart';
import 'dimension.dart';

class PropertySaleContract {
  final String title;
  final String city;
  final String district;
  final String governorate;
  final String mapReference;
  final String areaNumbers;
  final Boundaries boundaries;
  final CustomFields customFields;
  final String streetNameOrPlot;
  final Dimensions dimensions;
  final String coastalLimitLength;
  final String areaDescription;
  final String areaCm;
  final String day;
  final String date;
  final Party partyOne;
  final Party partyTwo;
  final String remainingAmount;
  final String taxFileNumber;
  final String taxYear;
  final String taxOwnerName;
  final String officialDisclosureNumber;

  PropertySaleContract({
    required this.title,
    required this.city,
    required this.district,
    required this.governorate,
    required this.mapReference,
    required this.areaNumbers,
    required this.boundaries,
    required this.customFields,
    required this.streetNameOrPlot,
    required this.dimensions,
    required this.coastalLimitLength,
    required this.areaDescription,
    required this.areaCm,
    required this.day,
    required this.date,
    required this.partyOne,
    required this.partyTwo,
    required this.remainingAmount,
    required this.taxFileNumber,
    required this.taxYear,
    required this.taxOwnerName,
    required this.officialDisclosureNumber,
  });

  factory PropertySaleContract.fromJson(Map<String, dynamic> json) {
    return PropertySaleContract(
      title: json['title'],
      city: json['city'],
      district: json['district'],
      governorate: json['governorate'],
      mapReference: json['mapReference'],
      areaNumbers: json['areaNumbers'],
      boundaries: Boundaries.fromJson(json['boundaries']),
      customFields: CustomFields.fromJson(json['customFields']),
      streetNameOrPlot: json['streetNameOrPlot'],
      dimensions: Dimensions.fromJson(json['dimensions']),
      coastalLimitLength: json['coastalLimitLength'],
      areaDescription: json['areaDescription'],
      areaCm: json['areaCm'],
      day: json['day'],
      date: json['date'],
      partyOne: Party.fromJson(json['partyOne']),
      partyTwo: Party.fromJson(json['partyTwo']),
      remainingAmount: json['remainingAmount'],
      taxFileNumber: json['taxFileNumber'],
      taxYear: json['taxYear'],
      taxOwnerName: json['taxOwnerName'],
      officialDisclosureNumber: json['officialDisclosureNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'city': city,
      'district': district,
      'governorate': governorate,
      'mapReference': mapReference,
      'areaNumbers': areaNumbers,
      'boundaries': boundaries.toJson(),
      'customFields': customFields.toJson(),
      'streetNameOrPlot': streetNameOrPlot,
      'dimensions': dimensions.toJson(),
      'coastalLimitLength': coastalLimitLength,
      'areaDescription': areaDescription,
      'areaCm': areaCm,
      'day': day,
      'date': date,
      'partyOne': partyOne.toJson(),
      'partyTwo': partyTwo.toJson(),
      'remainingAmount': remainingAmount,
      'taxFileNumber': taxFileNumber,
      'taxYear': taxYear,
      'taxOwnerName': taxOwnerName,
      'officialDisclosureNumber': officialDisclosureNumber,
    };
  }
}
