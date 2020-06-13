import 'package:flutter/material.dart';
import 'package:shopapp/providers/cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;
  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.product,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    const url = 'https://flutter-update-ed8e5.firebaseio.com/orders.json';
    final response = await http.get(url);
    print(response.body);
    final List<OrderItem> loadedOrder = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData==null){
      return ;
    }
    extractedData.forEach((OrderId, OrderData) {
      loadedOrder.add(OrderItem(
        id: OrderId,
        amount: OrderData['amount'],
        dateTime: DateTime.parse(OrderData['datetime']),
        product: (OrderData['products'] as List<dynamic>)
            .map((items) =>
                CartItem(
                    title: items['title'],
                    id: items['id'],
                    price: items['price'],
                    quantity: items['quantity']
                )
        )
            .toList(),
      ));
    });
    _orders=loadedOrder.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    const url = 'https://flutter-update-ed8e5.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'datetime': timeStamp.toIso8601String(),
          'products': cartProduct
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }));

    notifyListeners();
  }
}
