class CustomFields {
  final String southOwner;
  final String eastOwner;

  CustomFields({
    required this.southOwner,
    required this.eastOwner,
  });

  factory CustomFields.fromJson(Map<String, dynamic> json) {
    return CustomFields(
      southOwner: json['southOwner'],
      eastOwner: json['eastOwner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'southOwner': southOwner,
      'eastOwner': eastOwner,
    };
  }
}
