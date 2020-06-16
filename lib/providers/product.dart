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
  Future<void> toggleFavoriteStatus(String token,String userId) async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = 'https://flutter-update-ed8e5.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
    try{
      final response=await http.put(url,
          body: json.encode(
            isFavourite,
          ),
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
