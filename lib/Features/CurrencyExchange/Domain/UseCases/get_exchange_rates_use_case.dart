import 'package:dartz/dartz.dart';
import 'package:swypex_test/Core/Errors/failure.dart';
import 'package:swypex_test/Core/UseCases/use_case.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Entities/exchange_rates_request_data.dart';
import 'package:swypex_test/Features/CurrencyExchange/Domain/Repositories/currency_repository.dart';

class GetExchangeRatesUseCase implements UseCase<ExchangeRatesData,ExchangeRatesRequestData>{
  final CurrencyRepository _repo;
  GetExchangeRatesUseCase(this._repo);
  @override
  Future<Either<Failure, ExchangeRatesData>> call(ExchangeRatesRequestData data) {
    return _repo.getExchangeRates(data);
  }

}