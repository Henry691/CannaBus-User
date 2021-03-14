import 'package:cannabusco/provider/medicinal.dart';
import 'package:cannabusco/widgets/medicinal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'medicinal_card.dart';

class MedicinalProducts extends StatefulWidget {
  @override
  _MedicinalProductsState createState() => _MedicinalProductsState();
}

class _MedicinalProductsState extends State<MedicinalProducts> {
  @override
  Widget build(BuildContext context) {
    final medicinalProvider = Provider.of<MedicinalProvider>(context);

    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: medicinalProvider.medicinals.length,
            itemBuilder: (_, index) {
              return MedicinalCard(
                  medicinal: medicinalProvider.medicinals[index],
              );
            }));
  }
}
