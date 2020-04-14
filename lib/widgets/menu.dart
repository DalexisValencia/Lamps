import 'package:flutter/material.dart';


class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top:45,
          left: 5,
          width: MediaQuery.of(context).size.width - 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.all(0),
                  color: Color(0x00000000),
                  splashColor: Theme.of(context).backgroundColor,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)
                  )
                ),
                padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
                child: Container(
                  alignment: Alignment.center,
                  width: 28,
                  height: 28,
                  // color: Colors.grey,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    color: Color(0x000000000),
                    elevation: 0,
                    onPressed: (){},
                    padding: EdgeInsets.fromLTRB(2,2,0,0),
                    splashColor: Theme.of(context).backgroundColor,
                    child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: Icon(Icons.enhanced_encryption),
                      ),
                      Positioned(
                        top: 16,
                        left: 15,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor, 
                            borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      )
                    ],
                  ),
                  ),
                ),
              )
            ],
          ) 
          
        )
      ]
    );
  }
}