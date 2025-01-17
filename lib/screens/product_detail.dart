import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/highlight_item.dart';
import 'package:lavender_natural_cosmetics/components/main_drawer.dart';

class ProductDetail extends StatelessWidget {
  final String itemId;
  final String imageURI;
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;
  
  const ProductDetail({
    super.key,
    required this.itemId,
    required this.imageURI,
    required this.itemTitle,
    required this.itemPrice,
    required this.itemDescription,
  });

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
        ),
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: HighlightItem(
          itemId: itemId,
          imageURI: imageURI,
          itemTitle: itemTitle,
          itemPrice: itemPrice,
          itemDescription: itemDescription,
        ),
      ),
    );
  }
}
