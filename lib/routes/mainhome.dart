import 'package:flutter/material.dart';

import '../widgets/customactionbar.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(child: Text('HomePage')),
          CAB(),
        ],
      ),
    );
  }
}
