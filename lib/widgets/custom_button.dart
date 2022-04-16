import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.text, required this.onTap, required this.mode})
      : super(key: key);

  final String text;
  final Function onTap;
  final bool mode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mode ? Colors.transparent : Colors.black,
          borderRadius: BorderRadius.circular(13.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: mode ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
