import 'package:flutter/material.dart';

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
