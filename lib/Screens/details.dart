import 'package:flutter/material.dart';
import 'package:second_test/widgets/menu.dart';

class DetailPageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: DetailPage(),
    );
  }
}

class DetailPage extends StatefulWidget {
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
            //color: Colors.grey[300],
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
                    "LittMcMann",
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  Text(
                    "Theo II",
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
                          image: ExactAssetImage('assets/img-1.png')),
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
            child: MainMenu(),
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
                        iconText: '27´ x 12´',
                      ),
                      IconAndText(
                        nameIcon: Icons.archive,
                        iconText: 'ALL VIEW',
                      )
                    ],
                  ),
                  IconAndText(
                    nameIcon: Icons.palette,
                    iconText: 'black',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconAndText(
                        nameIcon: Icons.poll,
                        iconText: 'dark marble',
                      ),
                      Text(
                        "\$124.00",
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
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet turpis nisi. Vestibulum ut Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet turpis nisi.",
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipi",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    width: MediaQuery.of(context).size.width - 40,
                    child: RaisedButton(
                      elevation: 0,
                      color: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(15),
                      //padding: EdgeInsets.fromLTRB(0, 10, 0,10),
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
          // child: Container(
          //   color: Colors.blue,
          // ),
        )
      ],
    );
    // return Container(
    //   transform: Matrix4.translationValues(20.0, 0.0, 0.0),
    //   //color: Colors.blueAccent,
    //   height: MediaQuery.of(context).size.height / 2,
    //   //child: Text("Separarlo por componentes"),
    //   child: RotatedBox(
    //     quarterTurns: -3,
    //     child: ClipPath(
    //     clipper: TriangleClipper(),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         image: DecorationImage(
    //           fit: BoxFit.fitWidth,
    //           image: new NetworkImage('https://static.boredpanda.com/blog/wp-content/uploads/2015/03/Hyperrealistic-paintings-sweet-as-honey4__880.jpg')
    //         )
    //       ),

    //     ),
    //   ),
    //   )
    // );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.55);
    //path.quadraticBezierTo(x1, y1, x2, y2)
    path.quadraticBezierTo(size.width * 0.18, size.height * 0.42,
        size.width * 0.48, size.height * 0.56);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.75, size.width, 100);
    path.quadraticBezierTo(size.height + 200, -size.height, -size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldcleapper) => true;
}

class IconAndText extends StatelessWidget {
  final IconData nameIcon;
  final String iconText;
  IconAndText({
    this.nameIcon,
    this.iconText,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          nameIcon,
          color: Theme.of(context).primaryColorDark,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          iconText,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: Theme.of(context).primaryColorDark,
              ),
        )
      ],
    );
  }
}
