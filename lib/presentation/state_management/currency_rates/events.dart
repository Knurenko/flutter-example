import '../../../domain/model/base_currency_model.dart';

abstract class CurrencyRatesEvent {}

final class LoadRatesForBaseCurrency extends CurrencyRatesEvent {
  final BaseCurrencyModel value;

  LoadRatesForBaseCurrency(this.value);
}

final class ClearRateList extends CurrencyRatesEvent {}
