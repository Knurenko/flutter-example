import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/presentation/state_management/base_currency/bloc.dart';
import 'package:flutter_demo/presentation/state_management/base_currency/state.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/bloc.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/events.dart';
import 'package:flutter_demo/presentation/ui/theme/app_theme.dart';

import '../../../domain/model/base_currency_model.dart';
import '../../state_management/base_currency/events.dart';
import '../widgets/base_currency_selection_dropdown.dart';
import '../widgets/currency_rates_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCurrencyBloc, BaseCurrencyState>(
        builder: (context, state) {
      return switch (state) {
        BaseCurrencyInitialState() => _initial(context),
        BaseCurrenciesLoading() => _loading(),
        BaseCurrenciesLoadingFailure() => _error(state.errorMessage),
        BaseCurrenciesLoadedSuccessfully() => _success(
            baseCurrencies: state.list,
            onBaseCurrencySelected: (base) {
              context
                  .read<CurrencyRatesBloc>()
                  .add(LoadRatesForBaseCurrency(base));
            },
            onBaseCurrencyCleared: () {
              context.read<CurrencyRatesBloc>().add(ClearRateList());
            }),
      };
    });
  }

  Widget _initial(BuildContext context) {
    context.read<BaseCurrencyBloc>().add(LoadBaseCurrencies());

    return Container();
  }

  Widget _loading() => _baseView(
        body: Container(
          alignment: Alignment.center,
          color: AppTheme.colors.background,
          child: CupertinoActivityIndicator(
            color: AppTheme.colors.primary,
            radius: 32,
          ),
        ),
      );

  Widget _error(String message) => _baseView(
        body: Container(
          alignment: Alignment.center,
          color: AppTheme.colors.background,
          child: Text(
            message,
            style: TextStyle(
              color: AppTheme.colors.error,
              fontSize: 24,
            ),
          ),
        ),
      );

  Widget _success(
      {required List<BaseCurrencyModel> baseCurrencies,
      required Function(BaseCurrencyModel) onBaseCurrencySelected,
      required Function() onBaseCurrencyCleared}) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.primary,
          flexibleSpace: Container(
            margin: const EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            child: BaseCurrencyDropdownMenu(
              height: 44,
              listToShow: baseCurrencies,
              onBaseCurrencySelected: onBaseCurrencySelected,
              onClearBaseCurrency: onBaseCurrencyCleared,
            ),
          ),
        ),
        body: const CurrencyRatesView());
  }

  Widget _baseView({required Widget body}) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.colors.primary),
      body: body,
    );
  }
}
