import '../../../domain/model/base_currency_model.dart';

sealed class BaseCurrencyState {}

final class BaseCurrencyInitialState extends BaseCurrencyState {}

final class BaseCurrenciesLoading extends BaseCurrencyState {}

final class BaseCurrenciesLoadingFailure extends BaseCurrencyState {
  final String errorMessage;
  BaseCurrenciesLoadingFailure(this.errorMessage);
}

final class BaseCurrenciesLoadedSuccessfully extends BaseCurrencyState {
  final List<BaseCurrencyModel> list;
  BaseCurrenciesLoadedSuccessfully(this.list);
}
