import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/domain/model/base_currency_model.dart';
import 'package:flutter_demo/presentation/ui/theme/app_theme.dart';

class BaseCurrencyItem extends StatelessWidget {
  final BaseCurrencyModel _item;

  const BaseCurrencyItem(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            _item.shortname,
            style: TextStyle(
              color: AppTheme.colors.onBackground,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              _item.fullName,
              style: TextStyle(
                color: AppTheme.colors.onBackground.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
