import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './otp.dart';

class Welcome extends StatelessWidget {
  static const String routeName = 'welcome_screen';

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xff338ba4),
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
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
            ),
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                maxLength: 10,
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Mobile No.',
                    contentPadding: EdgeInsets.all(20),
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    filled: true,
                    fillColor: Colors.white),
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: RaisedButton(
                  color: Color(0xfff64f59),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Otp.routeName)),
            )
          ],
        ),
      ),
    );
  }
}
