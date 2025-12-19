class Vehicle {
  final String plateNumber;
  final String ownershipType;
  final String country;
  final String brand;
  final String model;
  final String engineNumber;
  final String chassisNumber;
  final String cylinders;

  Vehicle({
    required this.plateNumber,
    required this.ownershipType,
    required this.country,
    required this.brand,
    required this.model,
    required this.engineNumber,
    required this.chassisNumber,
    required this.cylinders,
  });

  Map<String, dynamic> toJson() => {
    "plateNumber": plateNumber,
    "ownershipType": ownershipType,
    "country": country,
    "brand": brand,
    "model": model,
    "engineNumber": engineNumber,
    "chassisNumber": chassisNumber,
    "cylinders": cylinders,
    "radioIncluded": true,
  };
}
