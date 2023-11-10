import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/state.dart';

import '../../../domain/repo/rates_repo.dart';
import 'events.dart';

final class CurrencyRatesBloc
    extends Bloc<CurrencyRatesEvent, CurrencyRatesState> {
  final CurrencyRatesRepository _repo;
  CancelableOperation? _lastOperation;

  CurrencyRatesBloc(this._repo) : super(NoBaseCurrencyToShowRates()) {
    on<LoadRatesForBaseCurrency>(_handleLoad);
    on<ClearRateList>(_handleClear);
  }

  void _handleLoad(
    LoadRatesForBaseCurrency event,
    Emitter<CurrencyRatesState> emitter,
  ) async {
    emitter.call(LoadingCurrencyRates());
    _lastOperation?.cancel();

    var future = _repo
        .fetchAllRates(event.value)
        .then((list) => emitter.call(RatesLoadedSuccessfully(list)))
        .catchError(
            (e) => emitter.call(RatesLoadingFailure(Exception(e.toString()))));

    _lastOperation = CancelableOperation.fromFuture(future);
    await _lastOperation?.value;
  }

  void _handleClear(
    ClearRateList event,
    Emitter<CurrencyRatesState> emitter,
  ) async {
    _lastOperation?.cancel();
    emitter.call(NoBaseCurrencyToShowRates());
  }
}
