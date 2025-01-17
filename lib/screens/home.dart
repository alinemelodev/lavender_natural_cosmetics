import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/main_drawer.dart';
import 'package:lavender_natural_cosmetics/screens/cart.dart';
import 'package:lavender_natural_cosmetics/screens/essential_oils.dart';
import 'package:lavender_natural_cosmetics/screens/cosmetics.dart';
import 'package:lavender_natural_cosmetics/screens/highlinghts.dart';
import 'package:lavender_natural_cosmetics/themes/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Highlinghts(),
      const EssentialOils(),
      const Cosmetics()
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 8,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: Image.asset(
                "assets/images/lavender_logo.png",
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Cart();
          }));
        },
        child: const Icon(
          Icons.shopping_cart_rounded,
          color: Colors.white,
          size: 35,
        ),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rounded),
            label: 'Destaques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Óleos Essenciais',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.spa),
            label: 'Cosméticos',
          ),
        ],
        selectedItemColor: AppColors.bottomNavigationBarIconColor,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
      body: pages.elementAt(_currentPage),
    );
  }
}
