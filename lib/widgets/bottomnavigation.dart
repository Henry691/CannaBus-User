import 'package:cannabusco/helpers/common.dart';
import 'package:cannabusco/provider/user.dart';
import 'package:cannabusco/screens/login.dart';
import 'package:cannabusco/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 45,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.explore),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              changeScreen(context, ScreensController());
            },
          ),
        ],
      ),
    );
  }
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return ProfilePage();
      default:
        return Login();
    }
  }
}
