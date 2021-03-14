import 'package:cannabusco/helpers/style.dart';
import 'package:cannabusco/models/product.dart';
import 'package:cannabusco/provider/app.dart';
import 'package:cannabusco/provider/user.dart';
import 'package:cannabusco/widgets/custom_text.dart';
import 'package:cannabusco/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../constants.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  const ProductDetails({Key key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();

  String _size = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _size = widget.product.sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      body: SafeArea(
        child: Container(
          color: Colors.black.withOpacity(0.9),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.center,
                    child: Loading(),
                  )),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.product.picture,
                      fit: BoxFit.fill,
                      height: 400,
                      width: double.infinity,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              kPrimaryColor,
                              kPrimaryColor.withOpacity(0.07),
                              kPrimaryColor.withOpacity(0.05),
                              kPrimaryColor.withOpacity(0.025),
                            ],
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container())),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                widget.product.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '\R${widget.product.price / 100}',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    top: 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          print("CLICKED");
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35))),
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          print("CLICKED");
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.ac_unit),
                                      Text("Organic",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("CLICKED");
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.block),
                                      Text("Zero THC",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          print("CLICKED");
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Column(
                                    // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.opacity),
                                      Text("2mg CBD",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.pink,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CustomText(
                                text: "Size",
                                color: white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButton<String>(
                                  value: _size,
                                  style: TextStyle(color: white),
                                  items: widget.product.sizes
                                      .map<DropdownMenuItem<String>>(
                                          (value) => DropdownMenuItem(
                                              value: value,
                                              child: CustomText(
                                                text: value,
                                                color: white,
                                              )))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _size = value;
                                    });
                                  }),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Description:\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s  Lorem Ipsum has been the industry standard dummy text ever since the 1500s ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "More",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
