import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/domain/model/currency_rate_model.dart';
import 'package:flutter_demo/presentation/ui/widgets/currency_rate_item.dart';

class CurrencyRatesListView extends StatelessWidget {
  final List<CurrencyRateModel> items;

  const CurrencyRatesListView(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CurrencyRateItem(items[index]),
      itemCount: items.length,
    );
  }
}
