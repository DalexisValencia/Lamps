import 'package:flutter/material.dart';
import 'package:second_test/Screens/Details/components/details__iconAndText.dart';
import 'package:second_test/Screens/Details/components/details__shape.dart';
import 'package:second_test/interfaces/products.dart';
import 'package:second_test/widgets/screens__menu.dart';

class DetailPageScaffold extends StatelessWidget {
  final ProductsModel product;
  DetailPageScaffold({
    this.product,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: DetailPage(product: product),
    );
  }
}

class DetailPage extends StatefulWidget {
  final ProductsModel product;
  DetailPage({
    this.product,
  });
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.45;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height + 20,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 5),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    widget.product.maker,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Table Lamp",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).primaryColorDark,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(40.0, 0.0, 0.0),
            height: height,
            child: RotatedBox(
              quarterTurns: -3,
              child: ClipPath(
                clipper: TriangleClipper(),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: ExactAssetImage(
                          widget.product.imageMain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          // color: Colors.grey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.40,
          child: SizedBox(
            width: double.infinity,
            child: MainMenu(
              goBack: true,
            ),
          ),
        ),
        Positioned(
          top: height + 20,
          height: MediaQuery.of(context).size.height * 0.50,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconAndText(
                        nameIcon: Icons.vibration,
                        iconText: widget.product.size, // '27´ x 12´',
                      ),
                      IconAndText(
                        nameIcon: Icons.archive,
                        iconText: 'ALL VIEW',
                      )
                    ],
                  ),
                  IconAndText(
                    nameIcon: Icons.palette,
                    iconText: widget.product.color,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconAndText(
                        nameIcon: Icons.poll,
                        iconText: widget.product.woodType,
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: Text(
                      widget.product.description,
                    ),
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   padding: EdgeInsets.only(top: 15),
                  //   child: Text(
                  //     "Lorem ipsum dolor sit amet, consectetur adipi",
                  //   ),
                  // ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width - 40,
                    child: RaisedButton(
                      elevation: 0,
                      color: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.all(15),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "ADD TO",
                            style:
                                Theme.of(context).textTheme.bodyText1.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.enhanced_encryption,
                            size: 18,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
