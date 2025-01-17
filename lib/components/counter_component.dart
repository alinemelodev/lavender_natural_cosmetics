import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:lavender_natural_cosmetics/providers/cart_provider.dart';

class CounterComponent extends StatefulWidget {
  final String productId;
  final int initialQuantity;
  final Function(int) onQuantityChanged;

  const CounterComponent({
    super.key,
    required this.productId,
    required this.initialQuantity,
    required this.onQuantityChanged,
  });

  @override
  State<CounterComponent> createState() => _CounterComponentState();
}

class _CounterComponentState extends State<CounterComponent> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialQuantity;
  }

  void _removeItem(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false)
        .removeItem(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              _counter++;
              widget.onQuantityChanged(_counter);
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.counterButtonColor,
            ),
            child: const Icon(Icons.arrow_drop_up),
          ),
        ),
        Text(
          _counter.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        if (_counter > 1)
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              setState(() {
                _counter--;
                widget.onQuantityChanged(_counter);
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.counterButtonColor,
              ),
              child: const Icon(Icons.arrow_drop_down),
            ),
          )
        else
          InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => _removeItem(context),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.counterButtonColor,
              ),
              child: const Icon(
                Icons.delete,
                size: 18,
                color: Color.fromRGBO(73, 69, 79, 1.0),
              ),
            ),
          ),
      ],
    );
  }
}
