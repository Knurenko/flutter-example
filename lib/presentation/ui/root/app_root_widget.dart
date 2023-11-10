import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/data/repo/base_currency_repo_impl.dart';
import 'package:flutter_demo/data/repo/currency_rates_repo_impl.dart';
import 'package:flutter_demo/domain/repo/base_currency_repo.dart';
import 'package:flutter_demo/domain/repo/rates_repo.dart';
import 'package:flutter_demo/presentation/state_management/base_currency/bloc.dart';
import 'package:flutter_demo/presentation/state_management/currency_rates/bloc.dart';

import '../screens/main_screen.dart';
import '../theme/app_theme.dart';

Widget getAppRoot() {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: AppTheme.current,
    home: const RootView(),
  );
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseCurrencyRepository baseCurrencyRepo = BaseCurrencyRepoImpl();
    final CurrencyRatesRepository ratesRepo = CurrencyRatesRepoImpl();

    return MultiBlocProvider(
      providers: [
        BlocProvider<BaseCurrencyBloc>(
          create: (context) => BaseCurrencyBloc(baseCurrencyRepo),
        ),
        BlocProvider<CurrencyRatesBloc>(
          create: (context) => CurrencyRatesBloc(ratesRepo),
        ),
      ],
      child: const MainScreen(),
    );
  }
}
