import 'package:flutter/material.dart';
import 'package:online_store/routes/const.dart';

class CAB extends StatelessWidget {
  const CAB({Key? key, required this.title, required this.number})
      : super(key: key);
  final String title;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 55.0, left: 18.0, right: 18.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Constans.headingTextStyle,
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: (BorderRadius.circular(6.5)),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
