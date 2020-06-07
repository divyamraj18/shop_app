import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'ypur Products'), //added const so that this widget doesn't rebuilds when data changes
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons
                  .add), //added const so that this widget doesn't rebuilds when data changes
              onPressed: () {})
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, i) => UserProductItem(
                title: productsData.items[i].title,
                imgUrl: productsData.items[i].imageUrl,
            )
        ),
      ),
    );
  }
}
