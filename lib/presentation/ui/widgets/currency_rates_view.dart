import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/domain/model/currency_rate_model.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/bloc.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/state.dart';
import 'package:flutter_demo/presentation/ui/widgets/currency_rates_list_view.dart';

import '../theme/app_theme.dart';

class CurrencyRatesView extends StatelessWidget {
  const CurrencyRatesView({super.key});

  Widget _loading() => Container(
        alignment: Alignment.center,
        color: AppTheme.colors.background,
        child: CupertinoActivityIndicator(
          color: AppTheme.colors.primary,
          radius: 32,
        ),
      );

  Widget _failure(String message) => Container(
        alignment: Alignment.center,
        color: AppTheme.colors.background,
        child: Text(
          message,
          style: TextStyle(
            color: AppTheme.colors.error,
            fontSize: 24,
          ),
        ),
      );

  Widget _baseCurrencyNotSelected() => Container(
        alignment: Alignment.center,
        color: AppTheme.colors.background,
        child: Text(
          "Base currency is not selected",
          style: TextStyle(
            color: AppTheme.colors.onBackground,
            fontSize: 24,
          ),
        ),
      );

  Widget _success(List<CurrencyRateModel> list) => CurrencyRatesListView(list);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CurrencyRatesBloc, CurrencyRatesState>(
        builder: (context, state) => switch (state) {
          LoadingCurrencyRates() => _loading(),
          NoBaseCurrencyToShowRates() => _baseCurrencyNotSelected(),
          RatesLoadingFailure() => _failure(state.reason.toString()),
          RatesLoadedSuccessfully() => _success(state.list)
        },
      );
}
