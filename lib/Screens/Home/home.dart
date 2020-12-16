import 'package:flutter/material.dart';
import 'package:second_test/Screens/Home/compoments/home__slider.dart';
import 'package:second_test/list/products.dart';
import 'package:second_test/widgets/menu.dart';

class HomePageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // void _changeMainImage(image) {
  //   setState(() {
  //     mainProductImage = image;
  //   });
  // }

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
              image: new ExactAssetImage(lamps[0].imageMain),
              fit: BoxFit.fill,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - sizeUnderBox,
          child: SizedBox(
            width: double.infinity,
            child: MainMenu(),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: 220,
          top: MediaQuery.of(context).size.height - sizeUnderBox,
          child: HomeSlider(
            onChangeOutPut: (item) {
              print("cuando cambia");
              print(item);
              print("item above");
            },
            sizeUnderBox: sizeUnderBox,
          ),
        )
      ],
    );
  }
}
