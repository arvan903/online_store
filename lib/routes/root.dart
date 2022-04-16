import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:online_store/routes/home.dart';
import 'package:online_store/routes/login.dart';
import 'const.dart';

class root extends StatelessWidget {
  root({Key? key}) : super(key: key);
  final Future<FirebaseApp> firebaseTest = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseTest,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Firebase is not connected',
                style: Constans.textStyleOne,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      '${streamSnapshot.error}',
                    ),
                  ),
                );
              }
              if (streamSnapshot.connectionState == ConnectionState.active) {
                //with ? after class name it become nullable
                User? user = streamSnapshot.data as User?;
                if (user == null) {
                  return LoginPage();
                } else {
                  return Home();
                }
              }
              return CircularProgressIndicator();
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
