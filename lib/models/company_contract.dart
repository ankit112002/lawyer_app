import 'company_supporting.dart';

class CompanyContractModel {
  final String contractDateFormatted;
  final List<Party> parties;
  final String companyName;
  final String purpose;
  final int durationYears;
  final String centerCity;
  final int capitalAmount;
  final int shareValue;
  final int totalShares;
  final int cashSharesTotal;
  final int inKindSharesTotal;
  final List<ShareTable> sharesTable;
  final int paidCashAmount;
  final List<InKindContribution> inKindContributions;
  final int inKindValuation;
  final String inKindContributorName;
  final List<Manager> managers;
  final List<Manager> managerCandidates;
  final String managerDuration;
  final int managersAnnualSalary;
  final int supervisionCount;
  final List<SupervisionMember> supervisionMembers;
  final int supervisionTermYears;
  final int minSharesForSupervision;
  final int supervisoryBoardSumAmount;
  final String assemblyCity;
  final String fiscalYearStart;
  final String fiscalYearEnd;
  final int reservePercentage;
  final int firstProfitSharePercentage;
  final int managersBonusPercentage;
  final int workersSharePercentage;
  final Auditor auditor;

  CompanyContractModel({
    required this.contractDateFormatted,
    required this.parties,
    required this.companyName,
    required this.purpose,
    required this.durationYears,
    required this.centerCity,
    required this.capitalAmount,
    required this.shareValue,
    required this.totalShares,
    required this.cashSharesTotal,
    required this.inKindSharesTotal,
    required this.sharesTable,
    required this.paidCashAmount,
    required this.inKindContributions,
    required this.inKindValuation,
    required this.inKindContributorName,
    required this.managers,
    required this.managerCandidates,
    required this.managerDuration,
    required this.managersAnnualSalary,
    required this.supervisionCount,
    required this.supervisionMembers,
    required this.supervisionTermYears,
    required this.minSharesForSupervision,
    required this.supervisoryBoardSumAmount,
    required this.assemblyCity,
    required this.fiscalYearStart,
    required this.fiscalYearEnd,
    required this.reservePercentage,
    required this.firstProfitSharePercentage,
    required this.managersBonusPercentage,
    required this.workersSharePercentage,
    required this.auditor,
  });

  factory CompanyContractModel.fromJson(Map<String, dynamic> json) {
    return CompanyContractModel(
      contractDateFormatted: json['contractDateFormatted'],
      parties: (json['parties'] as List)
          .map((e) => Party.fromJson(e))
          .toList(),
      companyName: json['companyName'],
      purpose: json['purpose'],
      durationYears: json['durationYears'],
      centerCity: json['centerCity'],
      capitalAmount: json['capitalAmount'],
      shareValue: json['shareValue'],
      totalShares: json['totalShares'],
      cashSharesTotal: json['cashSharesTotal'],
      inKindSharesTotal: json['inKindSharesTotal'],
      sharesTable: (json['sharesTable'] as List)
          .map((e) => ShareTable.fromJson(e))
          .toList(),
      paidCashAmount: json['paidCashAmount'],
      inKindContributions: (json['inKindContributions'] as List)
          .map((e) => InKindContribution.fromJson(e))
          .toList(),
      inKindValuation: json['inKindValuation'],
      inKindContributorName: json['inKindContributorName'],
      managers:
      (json['managers'] as List).map((e) => Manager.fromJson(e)).toList(),
      managerCandidates: (json['managerCandidates'] as List)
          .map((e) => Manager.fromJson(e))
          .toList(),
      managerDuration: json['managerDuration'],
      managersAnnualSalary: json['managersAnnualSalary'],
      supervisionCount: json['supervisionCount'],
      supervisionMembers: (json['supervisionMembers'] as List)
          .map((e) => SupervisionMember.fromJson(e))
          .toList(),
      supervisionTermYears: json['supervisionTermYears'],
      minSharesForSupervision: json['minSharesForSupervision'],
      supervisoryBoardSumAmount: json['supervisoryBoardSumAmount'],
      assemblyCity: json['assemblyCity'],
      fiscalYearStart: json['fiscalYearStart'],
      fiscalYearEnd: json['fiscalYearEnd'],
      reservePercentage: json['reservePercentage'],
      firstProfitSharePercentage: json['firstProfitSharePercentage'],
      managersBonusPercentage: json['managersBonusPercentage'],
      workersSharePercentage: json['workersSharePercentage'],
      auditor: Auditor.fromJson(json['auditor']),
    );
  }

  Map<String, dynamic> toJson() => {
    "contractDateFormatted": contractDateFormatted,
    "parties": parties.map((e) => e.toJson()).toList(),
    "companyName": companyName,
    "purpose": purpose,
    "durationYears": durationYears,
    "centerCity": centerCity,
    "capitalAmount": capitalAmount,
    "shareValue": shareValue,
    "totalShares": totalShares,
    "cashSharesTotal": cashSharesTotal,
    "inKindSharesTotal": inKindSharesTotal,
    "sharesTable": sharesTable.map((e) => e.toJson()).toList(),
    "paidCashAmount": paidCashAmount,
    "inKindContributions":
    inKindContributions.map((e) => e.toJson()).toList(),
    "inKindValuation": inKindValuation,
    "inKindContributorName": inKindContributorName,
    "managers": managers.map((e) => e.toJson()).toList(),
    "managerCandidates":
    managerCandidates.map((e) => e.toJson()).toList(),
    "managerDuration": managerDuration,
    "managersAnnualSalary": managersAnnualSalary,
    "supervisionCount": supervisionCount,
    "supervisionMembers":
    supervisionMembers.map((e) => e.toJson()).toList(),
    "supervisionTermYears": supervisionTermYears,
    "minSharesForSupervision": minSharesForSupervision,
    "supervisoryBoardSumAmount": supervisoryBoardSumAmount,
    "assemblyCity": assemblyCity,
    "fiscalYearStart": fiscalYearStart,
    "fiscalYearEnd": fiscalYearEnd,
    "reservePercentage": reservePercentage,
    "firstProfitSharePercentage": firstProfitSharePercentage,
    "managersBonusPercentage": managersBonusPercentage,
    "workersSharePercentage": workersSharePercentage,
    "auditor": auditor.toJson(),
  };
}
