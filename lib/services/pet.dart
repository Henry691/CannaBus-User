import 'package:cannabusco/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetServices {
  String collection = "pets";
  // ignore: deprecated_member_use
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PetModel>> getPets() async =>
      // ignore: deprecated_member_use
      _firestore.collection(collection).get().then((result) {
        List<PetModel> pets = [];
        // ignore: deprecated_member_use
        for (DocumentSnapshot pet in result.docs) {
          pets.add(PetModel.fromSnapshot(pet));
        }
        return pets;
      });

  Future<List<PetModel>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        // ignore: deprecated_member_use
        .get()
        .then((result) {
          List<PetModel> pets = [];
          // ignore: deprecated_member_use
          for (DocumentSnapshot pet in result.docs) {
            pets.add(PetModel.fromSnapshot(pet));
          }
          return pets;
        });
  }
}
