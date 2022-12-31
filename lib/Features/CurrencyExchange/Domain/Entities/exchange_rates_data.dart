class ExchangeRatesData {
  String startDate, endDate, base;
  Map rates;

  ExchangeRatesData({
    required this.base,
    required this.startDate,
    required this.endDate,
    required this.rates,
  });
}
