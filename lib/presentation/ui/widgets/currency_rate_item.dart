import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/domain/model/currency_rate_model.dart';
import 'package:flutter_demo/presentation/ui/theme/app_theme.dart';

class CurrencyRateItem extends StatelessWidget {
  final CurrencyRateModel item;

  const CurrencyRateItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        Text(
          item.name,
          style: TextStyle(fontSize: 16, color: AppTheme.colors.onBackground),
        ),
        const SizedBox(width: 32),
        Text(
          item.value.toStringAsFixed(2),
          style: TextStyle(
              fontSize: 16,
              color: AppTheme.colors.onBackground.withOpacity(.8)),
        )
      ],
    );
  }
}
