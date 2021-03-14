import 'package:cannabusco/models/trending.dart';
import 'package:cannabusco/services/trending.dart';
import 'package:flutter/material.dart';

class TrendingProvider with ChangeNotifier{
  TrendingServices _trendingServices = TrendingServices();
  List<TrendingModel> trendings = [];
  List<TrendingModel> trendingsSearched = [];


  TrendingProvider.initialize(){
    loadTrendings();
  }

  loadTrendings()async{
    trendings = await _trendingServices.getTrendings();
    notifyListeners();
  }



}