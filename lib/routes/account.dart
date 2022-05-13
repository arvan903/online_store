import 'package:flutter/material.dart';
import '../widgets/customactionbar.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('Account'),
          ),
          CAB(
            number: '0',
            title: 'Account',
          ),
        ],
      ),
    );
  }
}
