import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoe.dart';

class ShopProvider with ChangeNotifier{

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
        price: 345
    ),
    Shoe(
        name: "Air Force",
        brand: "Nike",
        //colors: [//colors.black,//colors.green],
        imageURL: "assets/images/nike2.png",
        price: 499
    ),
    Shoe(
        name: "Air Zoom",
        brand: "Nike",
        //colors: [//colors.grey,//colors.black],
        imageURL: "assets/images/nike3.png",
        price: 300
    ),
    Shoe(
        name: "Air Max",
        brand: "Nike",
        //colors: [//colors.white,//colors.red],
        imageURL: "assets/images/nike4.png",
        price: 345
    ),
    Shoe(
        name: "Air Jordan Max",
        brand: "Nike",
        //colors: [//colors.white12,//colors.indigo],
        imageURL: "assets/images/nike5.png",
        price: 999
    ),
    Shoe(
        name: "Air Jordan 1",
        brand: "Nike",
        //colors: [//colors.black,//colors.red],
        imageURL: "assets/images/nike6.png",
        price: 400
    ),
    Shoe(
        name: "Ultraboost",
        brand: "Adidas",
        //colors: [//colors.pink[50],//colors.black],
        imageURL: "assets/images/adidas1.png",
        price: 645
    ),
    Shoe(
        name: "Adizero",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.red],
        imageURL: "assets/images/adidas2.png",
        price: 199
    ),
    Shoe(
        name: "Alpha Bounce",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.orange],
        imageURL: "assets/images/adidas3.png",
        price: 200
    ),
    Shoe(
        name: "Solar Drive",
        brand: "Adidas",
        //colors: [//colors.white12,//colors.pink],
        imageURL: "assets/images/adidas4.png",
        price: 315
    ),
    Shoe(
        name: "Vigor",
        brand: "Adidas",
        //colors: [//colors.black,//colors.blueAccent],
        imageURL: "assets/images/adidas5.png",
        price: 399
    ),
    Shoe(
        name: "Running Blade",
        brand: "Adidas",
        //colors: [//colors.grey,//colors.blue],
        imageURL: "assets/images/adidas6.png",
        price: 800
    ),
    Shoe(
        name: "990 v4",
        brand: "New Balance",
        //colors: [//colors.grey[200],//colors.grey],
        imageURL: "assets/images/nb1.png",
        price: 199
    ),
    Shoe(
        name: "1080 v6",
        brand: "New Balance",
        //colors: [//colors.red,//colors.lightBlueAccent],
        imageURL: "assets/images/nb2.png",
        price: 500
    ),
    Shoe(
        name: "Arishi",
        brand: "New Balance",
        //colors: [//colors.white12,//colors.black],
        imageURL: "assets/images/nb3.png",
        price: 245
    ),
    Shoe(
        name: "Ultra Road",
        brand: "Skechers",
        //colors: [//colors.black,//colors.red],
        imageURL: "assets/images/skechers1.png",
        price: 300
    ),
    Shoe(
        name: "Razor 3",
        brand: "Skechers",
        //colors: [//colors.lightBlueAccent,//colors.pink],
        imageURL: "assets/images/skechers2.png",
        price: 269
    ),
    Shoe(
        name: "Go Run",
        brand: "Skechers",
        //colors: [//colors.white12,//colors.black87],
        imageURL: "assets/images/skechers3.png",
        price: 150
    ),
  ];


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