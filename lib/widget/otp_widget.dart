import 'package:flutter/material.dart';

class OtpWidget extends StatefulWidget {
  final void Function(String otp) onSubmit;
  final void Function(String otp) onChange;

  OtpWidget({this.onSubmit, this.onChange});

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final FocusNode firstNode = FocusNode();
  final FocusNode secondNode = FocusNode();
  final FocusNode thirdNode = FocusNode();
  final FocusNode fourthNode = FocusNode();

  final Map<String, String> _otp = {
    'one': '',
    'two': '',
    'three': '',
    'four': '',
  };

  Widget _otpInputBuilder({
    FocusNode currentFocusNode,
    FocusNode forwardFocusNode,
    FocusNode backwardFocusNode,
    void Function(String digit) singleDigit,
  }) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: currentFocusNode,
        maxLength: 1,
        style: TextStyle(fontSize: 25.4),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (String value) {
          singleDigit(value);
          if (value.trim().isEmpty) {
            FocusScope.of(context).requestFocus(backwardFocusNode);
          } else {
            FocusScope.of(context).requestFocus(forwardFocusNode);
          }

          String otp = '';
          _otp.forEach((key, value) => otp += value);
          if (otp.length == 4) widget.onChange(otp);
        },
        onSubmitted: (_) {
          String otp = '';
          _otp.forEach((key, value) => otp += value);
          if (otp.length == 4) widget.onSubmit(otp);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _otpInputBuilder(
          currentFocusNode: firstNode,
          forwardFocusNode: secondNode,
          backwardFocusNode: null,
          singleDigit: (digit) => _otp['one'] = digit,
        ),
        _otpInputBuilder(
          currentFocusNode: secondNode,
          forwardFocusNode: thirdNode,
          backwardFocusNode: firstNode,
          singleDigit: (digit) => _otp['two'] = digit,
        ),
        _otpInputBuilder(
          currentFocusNode: thirdNode,
          forwardFocusNode: fourthNode,
          backwardFocusNode: secondNode,
          singleDigit: (digit) => _otp['three'] = digit,
        ),
        _otpInputBuilder(
          currentFocusNode: fourthNode,
          forwardFocusNode: null,
          backwardFocusNode: thirdNode,
          singleDigit: (digit) => _otp['four'] = digit,
        ),
      ],
    );
  }
}
