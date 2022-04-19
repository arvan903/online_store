import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            setState(
              () {
                Get.snackbar(
                  'Successful',
                  'You are Logged Out !',
                  backgroundColor: Colors.greenAccent,
                  icon: Icon(Icons.check_circle),
                );
              },
            );
          },
          child: Text('Log Out!'),
        ),
      ),
    );
  }
}
