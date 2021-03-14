import 'package:cannabusco/provider/app.dart';
import 'package:cannabusco/provider/beauty.dart';
import 'package:cannabusco/provider/medicinal.dart';
import 'package:cannabusco/provider/pet.dart';
import 'package:cannabusco/provider/product.dart';
import 'package:cannabusco/provider/trending.dart';
import 'package:cannabusco/provider/user.dart';
import 'package:cannabusco/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserProvider.initialize()),
      ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ChangeNotifierProvider.value(value: MedicinalProvider.initialize()),
      ChangeNotifierProvider.value(value: PetProvider.initialize()),
      ChangeNotifierProvider.value(value: BeautyProvider.initialize()),
      ChangeNotifierProvider.value(value: TrendingProvider.initialize()),
      ChangeNotifierProvider.value(value: AppProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Splash(),
    ),
  ));
}
