import 'package:cannabusco/provider/pet.dart';
import 'package:cannabusco/widgets/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetProducts extends StatefulWidget {
  @override
  _PetProductsState createState() => _PetProductsState();
}

class _PetProductsState extends State<PetProducts> {
  @override
  Widget build(BuildContext context) {
    final petProvider = Provider.of<PetProvider>(context);

    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: petProvider.pets.length,
            itemBuilder: (_, index) {
              return PetCard(
                pet: petProvider.pets[index],
              );
            }));
  }
}
