import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String thumbnail;
  ProductCard({
    this.name,
    this.thumbnail,
  });
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
                      name,
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
                      image: new ExactAssetImage(thumbnail),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 20, top: 12),
              child: Text(
                "LittMcMan Theo it is a  classic model of a table lamp, will fi any chic and elegant interior",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "92,00",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   _createPage(
                    //     DetailPageScaffold(),
                    //   ),
                    // );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
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

// Route _createPage(child) {
//   return PageRouteBuilder(
//       pageBuilder: (BuildContext context, Animation animation,
//               Animation secondaryAnimation) =>
//           child,
//       transitionsBuilder: (BuildContext context, Animation animation,
//           Animation secondaryAnimation, child) {
//         //return child;
//         return SlideTransition(
//           position: new Tween<Offset>(
//             begin: const Offset(-1.0, 0.0),
//             end: Offset.zero,
//           ).animate(animation),
//           child: child,
//         );
//       });
// }
