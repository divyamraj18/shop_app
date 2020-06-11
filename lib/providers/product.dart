import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite,
  });
  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = 'https://flutter-update-ed8e5.firebaseio.com/product/$id.json';
    try{
      final response=await http.patch(url,
          body: json.encode({
            'isFavorite': isFavourite,
          }),
      );
      if(response.statusCode>=400)
        {
          isFavourite=oldStatus;
          notifyListeners();
        }
    }catch(error){
    isFavourite=oldStatus;
    notifyListeners();
    }

  }
}
