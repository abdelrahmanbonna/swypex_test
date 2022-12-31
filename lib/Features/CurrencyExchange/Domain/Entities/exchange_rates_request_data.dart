class ExchangeRatesRequestData {
  String base, symbols;
  DateTime startDate, endDate;

  ExchangeRatesRequestData({
    required this.base,
    required this.symbols,
    required this.startDate,
    required this.endDate,
  });
}