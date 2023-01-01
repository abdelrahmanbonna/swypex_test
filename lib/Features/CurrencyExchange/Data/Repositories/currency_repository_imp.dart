import 'package:dartz/dartz.dart';
import 'package:swypex_test/Core/Errors/failure.dart';
import 'package:swypex_test/Core/Errors/server_failure.dart';
import 'package:swypex_test/Features/CurrencyExchange/Data/DataSources/currency_data_source.dart';
import 'package:swypex_test/Features/CurrencyExchange/Data/Models/get_exchange_rates_request_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Data/Models/get_exchange_rates_response_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_request_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Repositories/currency_repository.dart';

class CurrencyRepositoryImp implements CurrencyRepository {
  final CurrencyDataSource _source;

  CurrencyRepositoryImp(this._source);

  /// Get the Exchange rates for a base currency and a conversion currency
  @override
  Future<Either<Failure, ExchangeRatesData>> getExchangeRates(
      ExchangeRatesRequestData data) async {
    var result = await _source.getExchangeRates(
        requestData:
            GetExchangeRatesRequestData.fromExchangeRatesRequestData(data));

    if (result.statusCode == 200) {
      var response = GetExchangeRatesResponseData.fromMap(result.data);
      if (response.success) {
        return Right(response.toExchangeRatesData());
      } else {
        return Left(ServerFailure("global.server_error"));
      }
    } else {
      return Left(ServerFailure(result.statusMessage??''));
    }
  }
}
