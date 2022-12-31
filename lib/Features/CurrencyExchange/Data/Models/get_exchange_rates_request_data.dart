import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_request_data.dart';

import '../DataSources/currency_data_source.dart';

/// This is a model for storing the [CurrencyDataSource] getExchangeRates request data which is required to make the api call
class GetExchangeRatesRequestData {
  String base, symbols,startDate, endDate;

  GetExchangeRatesRequestData({
    required this.base,
    required this.symbols,
    required this.startDate,
    required this.endDate,
  });

  /// Makes an object from [ExchangeRatesRequestData] object
  factory GetExchangeRatesRequestData.fromExchangeRatesRequestData(
      ExchangeRatesRequestData data) {
    return GetExchangeRatesRequestData(
      base: data.base,
      symbols: data.symbols,
      startDate: "${data.startDate.year}-${data.startDate.month}-${data.startDate.day}",
      endDate: "${data.endDate.year}-${data.endDate.month}-${data.endDate.day}",
    );
  }
}
