import 'package:cannabusco/models/beauty.dart';
import 'package:cannabusco/services/beauty.dart';
import 'package:flutter/material.dart';

class BeautyProvider with ChangeNotifier {
  BeautyServices _beautyServices = BeautyServices();
  List<BeautyModel> beautys = [];
  List<BeautyModel> beautysSearched = [];

  BeautyProvider.initialize() {
    loadBeautys();
  }

  loadBeautys() async {
    beautys = await _beautyServices.getBeautys();
    notifyListeners();
  }
}
