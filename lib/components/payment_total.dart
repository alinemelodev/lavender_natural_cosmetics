import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class PaymentTotal extends StatelessWidget {
  final double orderPrice;
  final double shippingPrice;
  final VoidCallback onFinalize;

  const PaymentTotal({
    super.key,
    required this.orderPrice,
    required this.shippingPrice,
    required this.onFinalize,
  });

  @override
  Widget build(BuildContext context) {
    final double totalPrice = orderPrice + shippingPrice;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Pedido:",
                style: TextStyle(
                  color: AppColors.paymentMethodReceiptColor,
                  fontSize: 16,
                ),
              ),
              Text(
                "R\$ ${orderPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Frete:",
                style: TextStyle(
                  color: AppColors.paymentMethodReceiptColor,
                  fontSize: 16,
                ),
              ),
              Text(
                "R\$ ${shippingPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Total:",
                style: TextStyle(
                  color: AppColors.paymentMethodReceiptColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "R\$ ${totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onFinalize,
          style: AppColors.buttonStyle,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.account_balance_wallet),
              ),
              Text(
                "Finalizar pedido",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
