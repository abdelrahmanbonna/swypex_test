import 'package:dio/dio.dart';

import '../Models/get_exchange_rates_request_data.dart';

/// This class holds all the APIs for the currency exchange
/// You could mock it for unit test purposes by injecting a mockito [Dio]
class CurrencyDataSource {
  final Dio _dio;

  CurrencyDataSource(this._dio);

  /// Gets the Exchange Rates from the server
  Future<Response> getExchangeRates({
    required GetExchangeRatesRequestData requestData,
  }) {
    return _dio.get(
      'timeseries?start_date=${requestData.startDate}&end_date=${requestData.endDate}&base=${requestData.base}&symbols=${requestData.symbols}',
    );
  }
}
