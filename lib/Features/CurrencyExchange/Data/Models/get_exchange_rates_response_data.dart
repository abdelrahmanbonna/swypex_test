import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_data.dart';

class GetExchangeRatesResponseData {
  bool success, timeSeries;
  String startDate, endDate, base;
  Map rates;

  GetExchangeRatesResponseData({
    required this.success,
    required this.timeSeries,
    required this.base,
    required this.startDate,
    required this.endDate,
    required this.rates,
  });

  /// Makes an object from a map this will be used to retrieve data from Data sources
  factory GetExchangeRatesResponseData.fromMap(Map map) {
    return GetExchangeRatesResponseData(
      success: map['success'] as bool,
      timeSeries: map['timeseries'] as bool,
      base: map['base'] as String,
      startDate: map['start_date'] as String,
      endDate: map['end_date'] as String,
      rates: map['rates'] as Map,
    );
  }

  /// Returns the data in a map
  Map toMap() {
    return {
      "success": success,
      "timeseries": timeSeries,
      "base": base,
      "start_date": startDate,
      "end_date": endDate,
      "rates": rates
    };
  }

  /// Makes an [ExchangeRatesData] Object from the current object
  ExchangeRatesData toExchangeRatesData() {
    return ExchangeRatesData(
      base: base,
      startDate: startDate,
      endDate: endDate,
      rates: rates,
    );
  }
}
