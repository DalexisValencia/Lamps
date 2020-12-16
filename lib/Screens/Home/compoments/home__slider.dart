import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:second_test/Screens/Home/compoments/home__productCard.dart';
import 'package:second_test/list/products.dart';

class HomeSlider extends StatelessWidget {
  final double sizeUnderBox;
  final Function onChangeOutPut;
  HomeSlider({
    this.sizeUnderBox,
    this.onChangeOutPut,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
      ),
      height: sizeUnderBox,
      color: Theme.of(context).primaryColor,
      child: Container(
        transform: Matrix4.translationValues(0.0, -85.0, 0),
        color: Color(0x00000000),
        child: CarouselSlider(
          height: 400,
          aspectRatio: 1,
          viewportFraction: 1.0,
          onPageChanged: (item) => onChangeOutPut(item),
          items: lamps.map((product) {
            return Builder(builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.only(
                  right: 20,
                  bottom: 5,
                ),
                child: ProductCard(
                  product: product,
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}
