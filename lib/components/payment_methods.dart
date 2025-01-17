import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class PaymentMethods extends StatefulWidget {
  final Function(int) onMethodSelected;

  const PaymentMethods({super.key, required this.onMethodSelected});

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> methods = [
      {'icon': Icons.pix, 'text': 'Pix', 'onTap': () {}},
      {
        'icon': Icons.qr_code_scanner_outlined,
        'text': 'Boleto',
        'onTap': () {}
      },
      {'icon': Icons.credit_card_outlined, 'text': 'Cartão', 'onTap': () {}},
    ];

    return Row(
      children: methods
          .asMap()
          .map((index, method) {
            return MapEntry(
              index,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onMethodSelected(index);
                      method['onTap']();
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[1],
                        borderRadius: BorderRadius.circular(10),
                        color: _selectedIndex == index
                            ? AppColors.backgroundCardColor
                            : Theme.of(context).cardColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Icon(
                              method['icon'],
                              color: _selectedIndex == index
                                  ? AppColors.primaryColor
                                  : null,
                            ),
                          ),
                          Text(
                            method['text'],
                            style: TextStyle(
                              color: _selectedIndex == index
                                  ? AppColors.primaryColor
                                  : null,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })
          .values
          .toList(),
    );
  }
}
