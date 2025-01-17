import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/themes/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:lavender_natural_cosmetics/providers/cart_provider.dart';
import 'package:lavender_natural_cosmetics/screens/home.dart';

void main() {
  runApp(const LavandaCosmeticosNaturais());
}

class LavandaCosmeticosNaturais extends StatelessWidget {
  const LavandaCosmeticosNaturais({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Lavanda",
        theme: MyTheme,
        home: const Home(),
      ),
    );
  }
}
