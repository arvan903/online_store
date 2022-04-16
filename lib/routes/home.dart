import 'package:flutter/material.dart';
import 'package:online_store/routes/const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'THis is a HomepAge',
          style: Constans.headingTextStyle,
        ),
      ),
    );
  }
}
