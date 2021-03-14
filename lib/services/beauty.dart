import 'package:cannabusco/models/beauty.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeautyServices {
  String collection = "beauty";
  // ignore: deprecated_member_use
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BeautyModel>> getBeautys() async =>
      // ignore: deprecated_member_use
      _firestore.collection(collection).get().then((result) {
        List<BeautyModel> beautys = [];
        // ignore: deprecated_member_use
        for (DocumentSnapshot beauty in result.docs) {
          beautys.add(BeautyModel.fromSnapshot(beauty));
        }
        return beautys;
      });

  Future<List<BeautyModel>> searchProducts({String productName}) {
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
          List<BeautyModel> beautys = [];
          // ignore: deprecated_member_use
          for (DocumentSnapshot beauty in result.docs) {
            beautys.add(BeautyModel.fromSnapshot(beauty));
          }
          return beautys;
        });
  }
}
