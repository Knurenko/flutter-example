import 'package:flutter_demo/domain/model/base_currency_model.dart';

abstract class BaseCurrencyRepository {
  Future<List<BaseCurrencyModel>> getAllBaseCurrencies();
}