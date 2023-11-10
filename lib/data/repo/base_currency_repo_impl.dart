import 'package:flutter_demo/domain/model/base_currency_model.dart';
import 'package:flutter_demo/domain/repo/base_currency_repo.dart';

final class BaseCurrencyRepoImpl extends BaseCurrencyRepository {
  @override
  Future<List<BaseCurrencyModel>> getAllBaseCurrencies() async {
    return await fetchAll();
  }

  Future<List<BaseCurrencyModel>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return _testValues;
  }

  final List<BaseCurrencyModel> _testValues = [
    BaseCurrencyModel("EUR", "Euro"),
    BaseCurrencyModel("USD", "United States Dollar"),
    BaseCurrencyModel("GBP", "British Pound Sterling"),
    BaseCurrencyModel("RUP", "Russian Ruble"),
    BaseCurrencyModel("INR", "Indian Rupee"),
    BaseCurrencyModel("KZT", "Kazakhstani Tenge"),
    BaseCurrencyModel("MDL", "Moldovan Leu"),
    BaseCurrencyModel("TRY", "Turkish Lira")
  ];
}
