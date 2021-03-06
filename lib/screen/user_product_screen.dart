import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screen/edit_product_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    print('hello');
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  static const routeName = '/UserProducts';
  @override
  Widget build(BuildContext context) {
    print('rebuilding....');
    final productsData = Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Your Products'), //added const so that this widget doesn't rebuilds when data changes
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons
                  .add), //added const so that this widget doesn't rebuilds when data changes
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              })
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Products>(
                      builder: (context, value, child) => Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                            itemCount: productsData.items.length,
                            itemBuilder: (_, i) => Column(
                                  children: <Widget>[
                                    UserProductItem(
                                      id: productsData.items[i].id,
                                      title: productsData.items[i].title,
                                      imgUrl: productsData.items[i].imageUrl,
                                    ),
                                    Divider(),
                                  ],
                                )),
                      ),
                    ),
                  ),
      ),
    );
  }
}
