import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/domain/repo/base_currency_repo.dart';
import 'package:flutter_demo/presentation/state_management/base_currency/state.dart';

import 'events.dart';

final class BaseCurrencyBloc
    extends Bloc<BaseCurrencyEvent, BaseCurrencyState> {
  final BaseCurrencyRepository _repo;

  BaseCurrencyBloc(this._repo) : super(BaseCurrencyInitialState()) {
    on<LoadBaseCurrencies>(_loadBaseCurrencies);
  }

  void _loadBaseCurrencies(LoadBaseCurrencies e, Emitter emit) async {
    emit(BaseCurrenciesLoading());

    await _repo.getAllBaseCurrencies().then((list) => {
      emit(BaseCurrenciesLoadedSuccessfully(list))
    }).catchError((e) => {
      emit(BaseCurrenciesLoadingFailure(e.toString()))
    });
  }
}
