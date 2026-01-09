class Payment {
  final String hourlyRate;
  final String dailyRent;
  final String dailyMaxHours;
  final String penaltyPerHour;

  Payment({
    required this.hourlyRate,
    required this.dailyRent,
    required this.dailyMaxHours,
    required this.penaltyPerHour,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      hourlyRate: json['hourlyRate'],
      dailyRent: json['dailyRent'],
      dailyMaxHours: json['dailyMaxHours'],
      penaltyPerHour: json['penaltyPerHour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hourlyRate": hourlyRate,
      "dailyRent": dailyRent,
      "dailyMaxHours": dailyMaxHours,
      "penaltyPerHour": penaltyPerHour,
    };
  }
}
