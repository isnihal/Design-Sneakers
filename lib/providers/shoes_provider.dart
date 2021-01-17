import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';

class ShoeProvider with ChangeNotifier{

  Shoe selectedShoe;

  double get totalSum {
    if (_cart.isEmpty)
      return 0;
    else {
      double sum = 0;
      _cart.forEach((shoe) {
        sum += shoe.price;
      });
      return sum;
    }
  }

  double get shippingFee{
    if(_cart.isEmpty) return 0;
    else return  _cart.length*4.5;
  }

  double get tax{
    if(_cart.isEmpty) return 0;
    else return totalSum  * 0.15;
  }

  double get totalAmount{
    if(_cart.isEmpty) return 0;
    else return totalSum+tax+shippingFee;
  }

  int _selectedBrand;

  void setSelectedBrand(int value){
    _selectedBrand = value;
    notifyListeners();
  }

  List<Shoe> _shoes = [
    Shoe(
        name: "Pegasus 30",
        brand: "Nike",
        imageURL: "assets/images/nike1.png",
        price: 345,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Shoe(
        name: "Air Force",
        brand: "Nike",
        //colors: [//colors.black,//colors.green],
        imageURL: "assets/images/nike2.png",
        price: 499,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Shoe(
        name: "Air Zoom",
        brand: "Nike",
        //colors: [//colors.grey,//colors.black],
        imageURL: "assets/images/nike3.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),
    Shoe(
        name: "Air Max",
        brand: "Nike",
        //colors: [//colors.white,//colors.red],
        imageURL: "assets/images/nike4.png",
        price: 345,
        discount: 5,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Air Jordan Max",
        brand: "Nike",
        //colors: [//colors.white12,//colors.indigo],
        imageURL: "assets/images/nike5.png",
        price: 999,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Ultraboost",
        brand: "Adidas",
        //colors: [//colors.pink[50],//colors.black],
        imageURL: "assets/images/adidas1.png",
        price: 645,
        discount: 4,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Adizero",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.red],
        imageURL: "assets/images/adidas2.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Alpha Bounce",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.orange],
        imageURL: "assets/images/adidas3.png",
        price: 200,
        discount: 30,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Solar Drive",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.pink],
        imageURL: "assets/images/adidas4.png",
        price: 315,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Vigor",
        brand: "Adidas",
        //colors: [//colors.black,//colors.blueAccent],
        imageURL: "assets/images/adidas5.png",
        price: 399,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),

    Shoe(
        name: "990 v4",
        brand: "New Balance",
        //colors: [//colors.grey[200],//colors.grey],
        imageURL: "assets/images/nb1.png",
        price: 199,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "1080 v6",
        brand: "New Balance",
        //colors: [//colors.red,//colors.lightBlueAccent],
        imageURL: "assets/images/nb2.png",
        price: 500,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),

    Shoe(
        name: "Ultra Road",
        brand: "Skechers",
        //colors: [//colors.black,//colors.red],
        imageURL: "assets/images/skechers1.png",
        price: 300,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    ),
    Shoe(
        name: "Razor 3",
        brand: "Skechers",
        //colors: [//colors.lightBlueAccent,//colors.pink],
        imageURL: "assets/images/skechers2.png",
        price: 269,
        discount: 0,
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    ),

  ];

  List<Shoe> get shoes{
    return [..._shoes];
  }


  List<Shoe> _cart = [];
  List<Shoe> get cart{
    return[..._cart];
  }

  List<Shoe> _wishlist  = [];
  List<Shoe> get wishlist{
    return[..._wishlist];
  }

  void addToCart(Shoe shoe){
    if(!_cart.contains(shoe)) _cart.add(shoe);
  }

  void removeFromCart(Shoe shoe) {
    _cart.remove(shoe);
    notifyListeners();
  }

  void addToWishList(Shoe shoe){
    _wishlist.add(shoe);
  }

  void removeFromWishList(Shoe shoe){
    print("Remove from wishlist");
    _wishlist.remove(shoe);
    notifyListeners();
  }

  bool isShoeInCart(Shoe shoe){
    for(int i=0;i<_cart.length;i++){
      Shoe obj = _cart[i];
      if(shoe.name == obj.name){
        return true;
      }
    }
    return false;
  }

  bool isShoeInWishlist(Shoe shoe){
    for(int i=0;i<_wishlist.length;i++){
      Shoe obj = _wishlist[i];
      if(shoe.name == obj.name){
        return true;
      }
    }
    return false;
  }
}