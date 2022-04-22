import 'package:flutter/material.dart';

import '../widgets/customactionbar.dart';

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text('Saved'),
          ),
          CAB(
            number: '0',
            title: 'Saved',
          ),
        ],
      ),
    );
  }
}
