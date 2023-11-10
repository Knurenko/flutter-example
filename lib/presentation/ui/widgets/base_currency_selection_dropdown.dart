import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/model/base_currency_model.dart';
import 'package:flutter_demo/presentation/ui/theme/app_theme.dart';
import 'package:flutter_demo/presentation/ui/widgets/base_currency_item.dart';

class BaseCurrencyDropdownMenu extends StatefulWidget {
  final List<BaseCurrencyModel> listToShow;
  final void Function(BaseCurrencyModel) onBaseCurrencySelected;
  final void Function() onClearBaseCurrency;

  final double height;

  const BaseCurrencyDropdownMenu({
    super.key,
    required this.listToShow,
    required this.onBaseCurrencySelected,
    required this.onClearBaseCurrency,
    this.height = 40,
  });

  @override
  State<StatefulWidget> createState() => _BaseCurrencyState();
}

class _BaseCurrencyState extends State<BaseCurrencyDropdownMenu> {
  BaseCurrencyModel? selectedBaseCurrency;

  void setSelected(BaseCurrencyModel? newValue) {
    setState(() {
      if (newValue != null) {
        widget.onBaseCurrencySelected(newValue);
        selectedBaseCurrency = newValue;
      } else {
        selectedBaseCurrency = null;
        widget.onClearBaseCurrency();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<BaseCurrencyModel>> dropdownMenuEntries =
        widget.listToShow
            .map((e) => DropdownMenuEntry(
                value: e, label: '${e.shortname} (${e.fullName})'))
            .toList();

    return DropdownMenu(
      label: Text(
        "Select base currency",
        style: TextStyle(color: AppTheme.colors.onPrimary),
      ),
      dropdownMenuEntries: dropdownMenuEntries,
      textStyle: TextStyle(color: AppTheme.colors.onPrimary),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints.tight(Size.fromHeight(widget.height)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onSelected: setSelected,
      selectedTrailingIcon: Icon(
        Icons.arrow_drop_up,
        color: AppTheme.colors.onPrimary,
      ),
      trailingIcon: selectedBaseCurrency != null
          ? IconButton(
              icon: Icon(
                Icons.close,
                color: AppTheme.colors.onPrimary,
              ),
              onPressed: () {
                setSelected(null);
              },
            )
          : Icon(
              Icons.arrow_drop_down,
              color: AppTheme.colors.onPrimary,
            ),
    );
  }

  DropdownMenuItem<BaseCurrencyModel> fromBaseCurrency(BaseCurrencyModel base) {
    return DropdownMenuItem(child: BaseCurrencyItem(base));
  }
}
