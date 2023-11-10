import '../model/base_currency_model.dart';
import '../model/currency_rate_model.dart';

abstract class CurrencyRatesRepository {
  Future<List<CurrencyRateModel>> fetchAllRates(BaseCurrencyModel base);
}