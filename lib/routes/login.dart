import 'package:flutter/material.dart';
import 'package:online_store/routes/const.dart';
import 'package:online_store/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Welcome to my Store',
                  style: Constans.headingTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                  text: 'Create New Account !',
                  onTap: () => print('OK'),
                  mode: true)
            ],
          ),
        ),
      ),
    );
  }
}
