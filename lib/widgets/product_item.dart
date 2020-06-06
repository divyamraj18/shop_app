import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/product.dart';
import '../screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
//  final String imageUrl;
//  ProductItem(
//      this.imageUrl,
//      this.title,
//      this.id
//      );
  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context,listen: false);
    final cart=Provider.of<Cart>(context,listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: product.id,
                );
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )),
          footer: GridTileBar(
            backgroundColor: Colors.black38,
            leading: Consumer<Product>(
              builder: (ctx,product,child)=>IconButton(
                splashColor: Colors.green,
                icon: Icon(product.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.purple,
                ),
                onPressed: () {
                  cart.addItem(product.id, product.price, product.title);
                }),
          ),
        ),
    );
  }
}