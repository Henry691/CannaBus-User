import 'package:cloud_firestore/cloud_firestore.dart';

class BeautyModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  //static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const MEDICINAL = "medicinal";
  static const QUANTITY = "quantity";
  static const BRAND = "brand";
  static const SALE = "sale";
  static const SIZES = "sizes";
  //static const COLORS = "colors";

  String _id;
  String _name;
  String _picture;

  String _category;
  String _brand;
  int _quantity;
  int _price;
  bool _sale;
  bool _featured;
  bool _medicinal;
  List _sizes;

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  int get quantity => _quantity;

  int get price => _price;

  bool get featured => _featured;

  bool get medicinal => _medicinal;

  bool get sale => _sale;

  List get sizes => _sizes;

  BeautyModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _brand = snapshot.data()[BRAND];
    _sale = snapshot.data()[SALE];

    _featured = snapshot.data()[FEATURED];
    _medicinal = snapshot.data()[MEDICINAL];
    _price = snapshot.data()[PRICE].floor();
    _category = snapshot.data()[CATEGORY];

    _sizes = snapshot.data()[SIZES];
    _name = snapshot.data()[NAME];
    _picture = snapshot.data()[PICTURE];
  }
}
