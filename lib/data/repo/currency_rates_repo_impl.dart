import 'dart:ffi';
import 'dart:math';

import 'package:flutter_demo/domain/model/base_currency_model.dart';

import 'package:flutter_demo/domain/model/currency_rate_model.dart';

import '../../domain/repo/rates_repo.dart';

final class CurrencyRatesRepoImpl extends CurrencyRatesRepository {
  @override
  Future<List<CurrencyRateModel>> fetchAllRates(BaseCurrencyModel base) async {
    await Future.delayed(const Duration(seconds: 2));
    return _getTestValues();
  }

  List<CurrencyRateModel> _getTestValues() {
    double random() => Random().nextDouble() * 30;

    return [
      CurrencyRateModel("EUR", random()),
      CurrencyRateModel("USD", random()),
      CurrencyRateModel("RUP", random()),
      CurrencyRateModel("TRY", random()),
      CurrencyRateModel("MDL", random()),
      CurrencyRateModel("GBP", random()),
      CurrencyRateModel("KOR", random()),
      CurrencyRateModel("JPN", random()),
      CurrencyRateModel("EKB", random()),
      CurrencyRateModel("SDK", random()),
      CurrencyRateModel("LOL", random()),
    ];
  }
}
