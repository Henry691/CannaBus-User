import 'package:cannabusco/provider/beauty.dart';
import 'package:cannabusco/widgets/beauty_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeautyProducts extends StatefulWidget {
  @override
  _BeautyProductsState createState() => _BeautyProductsState();
}

class _BeautyProductsState extends State<BeautyProducts> {
  @override
  Widget build(BuildContext context) {
    final beautyProvider = Provider.of<BeautyProvider>(context);

    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beautyProvider.beautys.length,
            itemBuilder: (_, index) {
              return BeautyCard(
                beauty: beautyProvider.beautys[index],
              );
            }));
  }
}
