import 'package:cannabusco/provider/trending.dart';
import 'package:cannabusco/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'trending_card.dart';

class TrendingProducts extends StatefulWidget {
  @override
  _TrendingProductsState createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
  @override
  Widget build(BuildContext context) {
    final trendingProvider = Provider.of<TrendingProvider>(context);

    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingProvider.trendings.length,
            itemBuilder: (_, index) {
              return TrendingCard(
                trending: trendingProvider.trendings[index],
              );
            }));
  }
}
