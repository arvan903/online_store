import 'package:flutter/material.dart';
import 'package:online_store/routes/const.dart';
import 'package:online_store/routes/sign_up.dart';
import 'package:online_store/widgets/custom_button.dart';
import 'package:online_store/widgets/custom_input.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isLoading = false;

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
              Column(
                children: [
                  CustomInput(
                    hintText: 'Enter Your Email ...',
                  ),
                  CustomInput(
                    hintText: 'Enter Your Password ...',
                  ),
                  CustomButton(
                    text: 'Login',
                    onTap: () => print('hi'),
                    mode: false,
                    loading: isLoading,
                  )
                ],
              ),
              CustomButton(
                text: 'Create New Account !',
                onTap: () => Get.to(() => SingUP()),
                mode: true,
                loading: isLoading,
              )
            ],
          ),
        ),
      ),
    );
  }
}
