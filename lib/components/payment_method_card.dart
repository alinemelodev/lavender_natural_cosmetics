import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Image(
          width: 30,
          image: AssetImage("assets/images/visa.png"),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "VISA Classic",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "****-6002",
                  style:
                      TextStyle(color: AppColors.paymentMethodCardNumberColor),
                ),
              ],
            ),
          ),
        ),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
