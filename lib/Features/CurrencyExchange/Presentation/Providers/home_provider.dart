import 'package:currency_picker/currency_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Core/Services/toast_service.dart';
import '../../../../Core/Services/web_service.dart';
import '../../Data/DataSources/currency_data_source.dart';
import '../../Data/Repositories/currency_repository_imp.dart';
import '../../Domain/Entities/exchange_rate.dart';
import '../../Domain/Entities/exchange_rates_data.dart';
import '../../Domain/Entities/exchange_rates_request_data.dart';
import '../../Domain/UseCases/get_exchange_rates_use_case.dart';

/// This class Holds the state of the Home Page and handles it
class HomeState extends ChangeNotifier {
  //finals
  final WebService _service = WebService();

  //late variables
  late CurrencyDataSource _source;
  late CurrencyRepositoryImp _currencyRepository;
  late GetExchangeRatesUseCase _exchangeRatesUseCase;

  //variables
  ExchangeRatesData? _data;
  DateTime _startDate = DateTime.now(), _endDate = DateTime.now();
  Currency? _base, _symbols;
  int length=10; //TODO use in Pagination

  HomeState() {
    _source = CurrencyDataSource(_service.publicDio);
    _currencyRepository = CurrencyRepositoryImp(_source);
    _exchangeRatesUseCase = GetExchangeRatesUseCase(_currencyRepository);
  }

  // Getters
  DateTime get startDate => _startDate;

  DateTime get endDate => _endDate;

  Currency? get base => _base;

  Currency? get symbols => _symbols;

  ExchangeRatesData? get data => _data;

  List<ExchangeRate> get rates {
    List<ExchangeRate> list = [];
    _data?.rates.forEach((key, value) {
      list.add(
        ExchangeRate(
          base: _base?.code ?? "",
          covertionCurr: _symbols?.code ?? '',
          price: value[_symbols?.code].toString(),
          date: key,
        ),
      );
    });
    return list;
  }

  // Setters
  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    _endDate = date;
    notifyListeners();
  }

  void setBase(Currency? code) {
    _base = code;
    notifyListeners();
  }

  void setSymbols(Currency? code) {
    _symbols = code;
    notifyListeners();
  }

  void setData(ExchangeRatesData? data) {
    _data = data;
    notifyListeners();
  }

  //Functions

  /// Makes requests using the provider variables which user change by choosing from menus
  Future<bool> getExchangeRates() async {
    if (_startDate.isAfter(_endDate)) {
      ToastService.showErrorToast(
          'home.start_date_should_be_before_end_date'.tr());
      return false;
    } else if (_base == null) {
      ToastService.showErrorToast('home.please_select_base_currency'.tr());
      return false;
    } else if (_symbols == null) {
      ToastService.showErrorToast(
          'home.please_select_currency_to_convert_to'.tr());
      return false;
    }

    EasyLoading.show();
    var result = await _exchangeRatesUseCase.call(
      ExchangeRatesRequestData(
        base: _base!.code,
        symbols: _symbols!.code,
        startDate: _startDate,
        endDate: _endDate,
      ),
    );
    EasyLoading.dismiss();

    return result.fold(
      (fail) {
        ToastService.showErrorToast(fail.message);
        return false;
      },
      (data) {
        setData(data);
        return true;
      },
    );
  }
}

/// Home state provider which provides the state to the UI
final homeProvider = ChangeNotifierProvider<HomeState>((ref) {
  return HomeState();
});
