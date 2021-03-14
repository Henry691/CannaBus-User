import 'package:cannabusco/models/medicinal.dart';
import 'package:cannabusco/services/medicinal.dart';
import 'package:flutter/material.dart';

class MedicinalProvider with ChangeNotifier {
  MedicinalServices _medicinalServices = MedicinalServices();
  List<MedicinalModel> medicinals = [];
  List<MedicinalModel> medicinalsSearched = [];

  MedicinalProvider.initialize() {
    loadMedicinals();
  }

  loadMedicinals() async {
    medicinals = await _medicinalServices.getMedicinals();
    notifyListeners();
  }

  Future search({String productName}) async {
    medicinalsSearched =
        await _medicinalServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
