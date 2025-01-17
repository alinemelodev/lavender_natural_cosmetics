import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromRGBO(118, 95, 122, 1.0);
  static const secondaryColor = Color.fromRGBO(129, 133, 96, 1.0);
  static const buttonForeground = Colors.white;
  static const buttonBackground = Color.fromRGBO(103, 80, 164, 1.0);
  static const drawerFontColor = Color.fromRGBO(73, 69, 79, 1.0);
  static const drawerIconColor = Color.fromRGBO(73, 69, 79, 1.0);
  static const counterButtonColor = Color.fromRGBO(204, 182, 219, 1.0);
  static const bottomNavigationBarIconColor = Color.fromRGBO(129, 133, 96, 1.0);
  static const paymentMethodCardNumberColor = Color.fromRGBO(156, 156, 156, 1.0);
  static const paymentMethodReceiptColor = Color.fromRGBO(157, 157, 157, 1.0);
  static const backgroundCardColor = Color.fromRGBO(235, 222, 235, 1.0);


  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    elevation: 1,
    foregroundColor: buttonForeground,
    backgroundColor: primaryColor,
  );
}
