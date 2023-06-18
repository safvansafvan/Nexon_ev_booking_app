class Dealer {
  final String dealerName;
  final String city;

  Dealer({required this.dealerName, required this.city});

  String get name => dealerName;

  String get location => city;
}
