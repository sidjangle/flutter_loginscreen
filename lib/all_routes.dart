import 'package:flutter/cupertino.dart';
import './otp.dart';
import './welcome.dart';

dynamic allRoutes(BuildContext context) {
  return {
    Welcome.routeName: (context) => Welcome(),
    Otp.routeName: (context) => Otp(),
  };
}
