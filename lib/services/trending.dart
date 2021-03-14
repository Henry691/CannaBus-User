import 'package:cannabusco/models/trending.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrendingServices {
  String collection = "trendings";
  // ignore: deprecated_member_use
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TrendingModel>> getTrendings() async =>
      // ignore: deprecated_member_use
      _firestore.collection(collection).get().then((result) {
        List<TrendingModel> trendings = [];
        // ignore: deprecated_member_use
        for (DocumentSnapshot trending in result.docs) {
          trendings.add(TrendingModel.fromSnapshot(trending));
        }
        return trendings;
      });

  Future<List<TrendingModel>> searchProducts({String productName}) {
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
          List<TrendingModel> trendings = [];
          // ignore: deprecated_member_use
          for (DocumentSnapshot trending in result.docs) {
            trendings.add(TrendingModel.fromSnapshot(trending));
          }
          return trendings;
        });
  }
}
