import 'package:cannabusco/models/pet.dart';
import 'package:cannabusco/services/pet.dart';
import 'package:flutter/material.dart';

class PetProvider with ChangeNotifier {
  PetServices _petServices = PetServices();
  List<PetModel> pets = [];
  List<PetModel> petsSearched = [];

  PetProvider.initialize() {
    loadPets();
  }

  loadPets() async {
    pets = await _petServices.getPets();
    notifyListeners();
  }
}
