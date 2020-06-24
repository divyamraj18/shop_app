import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  //ProductDetailScreen(
  //  this.title,
  //  );
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findbyId(productId);
    return Scaffold(
      /*appBar: AppBar(
        title: Text(loadedProduct.title),
      ),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(title: Text(loadedProduct.title),
            background: Hero(
              tag: productId,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20,),
              textAlign: TextAlign.center,

            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
            ),
            SizedBox(height: 800,)
          ]
          )
          ),
        ],

      ),
    );
  }
}
