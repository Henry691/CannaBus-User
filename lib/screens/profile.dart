import 'package:cannabusco/provider/product.dart';
import 'package:cannabusco/provider/user.dart';
import 'package:cannabusco/services/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _key = GlobalKey<ScaffoldState>();
  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: userProvider.userModel?.name ?? "username lading...",
                    style: Theme.of(context).textTheme.button),
                TextSpan(
                  text: userProvider.userModel?.email ?? "email loading...",
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
