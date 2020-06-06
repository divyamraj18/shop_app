import 'package:flutter/material.dart';
import 'product.dart';
class Products with ChangeNotifier{
  List<Product> _items=[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Television',
      description: 'Smart mI TV.',
      price: 99.99,
      imageUrl:
      'https://images-na.ssl-images-amazon.com/images/I/81t2A6uhm4L._SX466_.jpg',
    ),
    Product(
      id: 'p6',
      title: 'I phone 11',
      description: 'the brand new i ohone 11',
      price: 999.99,
      imageUrl:
      'https://rukminim1.flixcart.com/image/416/416/k2jbyq80pkrrdj/mobile-refurbished/z/a/f/iphone-11-pro-max-256-u-mwhm2hn-a-apple-0-original-imafkg2ftc5cze5n.jpeg?q=70',
    ),
    Product(
      id: 'p7',
      title: 'Python',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images-eu.ssl-images-amazon.com/images/I/51wjAacCoSL._AC_SY200_.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Brain Burner',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images-eu.ssl-images-amazon.com/images/I/41vLoB60BxL._AC_SY200_.jpg',
    ),
    Product(
      id: 'Office Chair',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images-eu.ssl-images-amazon.com/images/G/31/IMG19/Furniture/Rise2020/officechairs_440x460.jpg',
    ),
    Product(
      id: 'p10',
      title: 'lappy table',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images-eu.ssl-images-amazon.com/images/G/31/IMG19/Furniture/Rise2020/lapdesks_440x460.jpg',
    ),
    Product(
      id: 'p11',
      title: 'book shelves',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images.unsplash.com/photo-1544396821-4dd40b938ad3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    ),
    Product(
      id: 'p12',
      title: 'bean bag',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images.unsplash.com/photo-1501876991173-f9c47cd28268?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=706&q=80',
    ),
    Product(
      id: 'p13',
      title: 'powder milk',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://images.unsplash.com/photo-1587185717365-a1b43fafb42b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80',
    ),
    Product(
      id: 'p14',
      title: 'shampoo',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
        'https://images.unsplash.com/photo-1519735777090-ec97162dc266?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=815&q=80'
    )
  ];
  List<Product> get items {
    return [... _items];
  }
  List<Product> get favitems {
    return  _items.where((element) => element.isFavourite).toList();
  }
  Product findbyId(String id)
  {
    return _items.firstWhere((prod) => prod.id == id);
  }
    void addProduct(){
      //_items.add(value);
      notifyListeners();
    }
}