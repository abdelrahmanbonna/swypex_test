import 'package:dartz/dartz.dart';
import '../Entities/exchange_rates_request_data.dart';
import '../Entities/exchange_rates_data.dart';
import '../../../../Core/Errors/failure.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, ExchangeRatesData>> getExchangeRates(
      ExchangeRatesRequestData data);
}
