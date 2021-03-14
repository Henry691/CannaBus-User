import 'package:cannabusco/models/medicinal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicinalServices {
  String collection = "medicinals";
  // ignore: deprecated_member_use
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MedicinalModel>> getMedicinals() async =>
      // ignore: deprecated_member_use
      _firestore.collection(collection).get().then((result) {
        List<MedicinalModel> medicinals = [];
        // ignore: deprecated_member_use
        for (DocumentSnapshot medicinal in result.docs) {
          medicinals.add(MedicinalModel.fromSnapshot(medicinal));
        }
        return medicinals;
      });

  Future<List<MedicinalModel>> searchProducts({String productName}) {
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
          List<MedicinalModel> medicinals = [];
          // ignore: deprecated_member_use
          for (DocumentSnapshot medicinal in result.docs) {
            medicinals.add(MedicinalModel.fromSnapshot(medicinal));
          }
          return medicinals;
        });
  }
}
