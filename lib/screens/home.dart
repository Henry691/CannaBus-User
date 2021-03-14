import 'package:cannabusco/constants.dart';
import 'package:cannabusco/provider/product.dart';
import 'package:cannabusco/provider/user.dart';
import 'package:cannabusco/screens/product_search.dart';
import 'package:cannabusco/screens/title_with_more_bbtn.dart';
import 'package:cannabusco/services/product.dart';
import 'package:cannabusco/widgets/beauty_products.dart';
import 'package:cannabusco/widgets/bottomnavigation.dart';
import 'package:cannabusco/widgets/featured_products.dart';
import 'package:cannabusco/widgets/medicinal_products.dart';
import 'package:cannabusco/widgets/pet_products.dart';
import 'package:cannabusco/helpers/common.dart';
import 'package:cannabusco/helpers/style.dart';
import 'package:cannabusco/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<ScaffoldState>();
  ProductServices _productServices = ProductServices();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _key,
      backgroundColor: white,
      body: SafeArea(
        child: ListView(children: <Widget>[
//           Custom App bar
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 0 + kDefaultPadding,
            ),
            height: size.height * 0.20 - 25,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/LOGO.jpg',
                  width: 300.0,
                )),

            //Spacer(),
            //Image.asset("assets/images/logo.png")
          ),

//          Search Text field
//            Search(),

          Container(
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(36),
                    bottomLeft: Radius.circular(36))),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 8, right: 8, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: black,
                  ),
                  title: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (pattern) async {
                      await productProvider.search(productName: pattern);
                      changeScreen(context, ProductSearchScreen());
                    },
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),

//            featured products

          TitleWithMoreBtn(title: "Best Selling", press: () {}),
          FeaturedProducts(),
          TitleWithMoreBtn(title: "Medicinal Products", press: () {}),
          MedicinalProducts(),
          TitleWithMoreBtn(title: "Beauty Products", press: () {}),
          BeautyProducts(),
          //TitleWithMoreBtn(title: "Pet Products", press: () {}),
          //PetProducts(),
          //TitleWithMoreBtn(title: "Edibles", press: () {}),
          //FeaturedProducts(),

//          recent products
          TitleWithMoreBtn(title: "Trending Products", press: () {}),

//          recent products
          Column(
            children: productProvider.products
                .map((item) => GestureDetector(
                      child: ProductCard(
                        product: item,
                      ),
                    ))
                .toList(),
          ),
        ]),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class MedicinalCard extends StatelessWidget {
  const MedicinalCard({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
