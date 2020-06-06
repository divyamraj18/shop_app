import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import 'package:shopapp/widgets/badge.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  var _showOnlyFavoritesData = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myShopApp'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites)
                  _showOnlyFavoritesData = true;
                else
                  _showOnlyFavoritesData = false;
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Favourites',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'All items',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue),
                ),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(builder: (_,cart,ch)=>Badge(
            child: ch,
              value: cart.itemCount.toString(),
            ),
              child:
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }),
           )
        ],
      ),
      drawer: AppDrawer(),
      body: new ProductsGrid(_showOnlyFavoritesData),
    );
  }
}
