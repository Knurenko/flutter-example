import '../../../domain/model/currency_rate_model.dart';

sealed class CurrencyRatesState {}

final class LoadingCurrencyRates extends CurrencyRatesState {}

final class NoBaseCurrencyToShowRates extends CurrencyRatesState {}

final class RatesLoadedSuccessfully extends CurrencyRatesState {
  final List<CurrencyRateModel> list;

  RatesLoadedSuccessfully(this.list);
}

final class RatesLoadingFailure extends CurrencyRatesState {
  final Exception reason;

  RatesLoadingFailure(this.reason);
}
