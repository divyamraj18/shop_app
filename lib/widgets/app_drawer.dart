import 'package:flutter/material.dart';
import 'package:shopapp/screen/orders_screen.dart';
import 'package:shopapp/screen/user_product_screen.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(
      children: <Widget>[
        AppBar(
          title: Text('hello friends'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(leading: Icon(Icons.shop),title: Text('Shop'),
        onTap:() {
          Navigator.of(context).pushReplacementNamed('/');
        }
        ),
        Divider(),
        ListTile(leading: Icon(Icons.payment),title: Text('Orders'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            }
        ),
        Divider(),
        ListTile(leading: Icon(Icons.mode_edit),title: Text('manage products'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            }
        )
      ],
    ),);
  }
}
