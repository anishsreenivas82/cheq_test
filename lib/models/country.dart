class CountryClass {
  final String name;
  final int countryCode;
  final String isoCountryCode;
  // final String flagPath;
  CountryClass(
      {required this.name,
      required this.isoCountryCode,
      required this.countryCode});

  factory CountryClass.fromJson(Map<String, dynamic> json) {
    return CountryClass(
      name: json['name'],
      isoCountryCode: json['isoCountryCode'],
      countryCode: json['countryCode'],
    );
  }
}
