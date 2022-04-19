import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  //by adding (String) the input is String now
  final Function(String) onChanged;
  final bool checkPassword;

  const CustomInput({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.checkPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        color: Color(
          0xFFF2F2F2,
        ),
      ),
      child: TextField(
        obscureText: checkPassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
        ),
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
