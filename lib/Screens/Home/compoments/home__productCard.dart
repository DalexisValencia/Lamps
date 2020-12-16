import 'package:flutter/material.dart';
import 'package:second_test/Screens/Details/details.dart';
import 'package:second_test/interfaces/products.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel product;
  ProductCard({this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
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
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Table Lamp',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    image: DecorationImage(
                      image: new ExactAssetImage(
                        product.thumbnail,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 20, top: 12),
              child: Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  onPressed: () {
                    Navigator.of(context).push(
                      _createPage(
                        DetailPageScaffold(
                          product: product,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "DETAILS",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
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
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}
