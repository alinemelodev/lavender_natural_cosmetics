import 'package:flutter/material.dart';
import 'package:lavender_natural_cosmetics/components/highlight_item.dart';
import 'package:lavender_natural_cosmetics/products.dart';

class Highlinghts extends StatelessWidget {
  const Highlinghts({super.key});

  final List items = highlights;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Text(
                    "Destaques",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(118, 95, 122, 1.0)),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "Confira os queridinhos do mês de janeiro",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(118, 95, 122, 1.0)),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: HighlightItem(
                    itemId: items[index]["id"],
                    imageURI: items[index]["image"],
                    itemTitle: items[index]["name"],
                    itemPrice: items[index]["price"],
                    itemDescription: items[index]["description"],
                  ),
                );
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
