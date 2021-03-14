import 'dart:async';
import 'package:cannabusco/models/cart_item.dart';
import 'package:cannabusco/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).update(data);
      print("USER WAS CREATED");
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        print("==========id is $id=============");
        debugPrint("==========NAME is ${doc.data()['name']}=============");
        debugPrint("==========NAME is ${doc.data()['name']}=============");
        debugPrint("==========NAME is ${doc.data()['name']}=============");
        debugPrint("==========NAME is ${doc.data()['name']}=============");

        print("==========NAME is ${doc.data()['name']}=============");
        print("==========NAME is ${doc.data()['name']}=============");
        print("==========NAME is ${doc.data()['name']}=============");

        return UserModel.fromSnapshot(doc);
      });

  void addToCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
