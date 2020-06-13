import 'package:flutter/material.dart';
import 'product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favitems {
    return _items.where((element) => element.isFavourite).toList();
  }

  Product findbyId(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  /*Future<void> addProduct(Product product) {//different way to implement the add product method
    //_items.add(value);
    const url='https://flutter-update-ed8e5.firebaseio.com/product.json';
    return http.post(url,body:json.encode({
      'title':product.title,
      'description':product.description,
      'imageUrl': product.imageUrl,
       'price': product.price,
      'isFavorite':product.isFavourite,
    }), ).then((value){
        print(json.decode(value.body));
        final newProduct = Product(
        id: json.decode(value.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
        _items.add(newProduct);
        notifyListeners();
    }).catchError((error){
      print(error);
          throw error;
    });
  }*/
  Future<bool> fetchAndSetProducts() async {
    const url = 'https://flutter-update-ed8e5.firebaseio.com/product.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProduct = [];
      if(extractedData==null)
        {
          return null;
        }
          extractedData.forEach((prodId, prodData) {
            loadedProduct.add(Product(
              id: prodId,
              title: prodData['title'],
              description: prodData['description'],
              price: prodData['price'],
              imageUrl: prodData['imageUrl'],
              isFavourite: prodData['isFavorite'],
            ));
          });
          _items=loadedProduct;
          notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    //_items.add(value);
    const url = 'https://flutter-update-ed8e5.firebaseio.com/product.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavourite,
        }),
      );
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }

    //
    //});
  }

  Future<void> updateProduct(String id, Product newProduct) async{
    final prodIndex = _items.indexWhere((element) => element.id == id);
    if(prodIndex>=0) {
      final url='https://flutter-update-ed8e5.firebaseio.com/product/$id.json';
      await http.patch(url,body:json.encode({
        'title':newProduct.title,
        'description':newProduct.description,
        'imageUrl':newProduct.imageUrl,
        'price':newProduct.price,
      }),
      );
      _items[prodIndex] = newProduct;
    }

    notifyListeners();
  }

  Future<void> deleteProduct(String id) {
    final url='https://flutter-update-ed8e5.firebaseio.com/product/$id.json';
    final existingProductIndex=_items.indexWhere((element) => element.id==id);
    var existingProduct=_items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    http.delete(url).then((_){
      existingProduct=null;
    }).catchError((_){
      _items.insert(existingProductIndex, existingProduct);
    });
    notifyListeners();
  }
}
