import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:second_test/interfaces/products.dart';
import 'package:second_test/pages/details.dart';
import 'package:second_test/widgets/menu.dart';

class HomePageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: HomePageBody(),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String mainProductImage = 'assets/img-1.png';
  final List<ProductsModel> products = List<ProductsModel>.generate(2, (i) {
    var index = i + 1;
    return ProductsModel(
        name: 'Theo $index',
        imageMain: 'assets/img-$index.png',
        thumbnail: 'assets/detail-$index.png');
  });

  void _changeMainImage(image) {
    setState(() {
      mainProductImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sizeUnderBox = 170;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                    image: new ExactAssetImage(mainProductImage),
                    fit: BoxFit.fill)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - sizeUnderBox,
            child: SizedBox(width: double.infinity, child: MainMenu())),
        Positioned(
            width: MediaQuery.of(context).size.width,
            height: 220,
            top: MediaQuery.of(context).size.height - sizeUnderBox,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              height: sizeUnderBox,
              color: Theme.of(context).primaryColor,
              child: Container(
                transform: Matrix4.translationValues(0.0, -85.0, 0),
                color: Color(0x00000000),
                child: CarouselSlider(
                  height: 400,
                  aspectRatio: 1,
                  viewportFraction: 1.0,
                  onPageChanged: (item) {
                    // print();
                    _changeMainImage(products[item].imageMain);
                  },
                  items: products.map((product) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.only(right: 20, bottom: 5),
                        child: ProductCard(
                            name: product.name, thumbnail: product.thumbnail),
                        //child: ProductCard(),
                      );
                    });
                  }).toList(),
                ),
              ),
            )),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String thumbnail;
  ProductCard({this.name, this.thumbnail});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'LittMcMan',
                      style: Theme.of(context).textTheme.caption.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      name,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('Table Lamp',
                        style: TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                ),
                Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                      //color: Colors.red,
                      image: DecorationImage(
                          image: new ExactAssetImage(thumbnail))),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 20, top: 12),
              child: Text(
                  "LittMcMan Theo it is a  classic model of a table lamp, will fi any chic and elegant interior",
                  style: TextStyle(
                    color: Colors.grey,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "92,00",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  onPressed: () {
                    Navigator.of(context)
                        .push(_createPage(DetailPageScaffold()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "DETAILS",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Route _createPage(child) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) =>
          child,
      transitionsBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation, child) {
        //return child;
        return SlideTransition(
          position: new Tween<Offset>(
                  begin: const Offset(-1.0, 0.0), end: Offset.zero)
              .animate(animation),
          child: child,
        );
      });
}
