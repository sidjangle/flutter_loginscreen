import 'package:flutter/material.dart';
import 'package:loginscreen/welcome.dart';

import './widget/otp_widget.dart';

class Otp extends StatelessWidget {
  static const String routeName = 'otp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xff12c2e9),
                const Color(0xffc471ed)
              ], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: new IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () =>
                          {Navigator.of(context).pushNamed(Welcome.routeName)},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                'Otp',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              Padding(padding: EdgeInsets.all(20)),
              OtpWidget(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: RaisedButton(
                    color: Color(0xfff64f59),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(Otp.routeName)),
              ),
            ],
          ),
        ));
  }
}
