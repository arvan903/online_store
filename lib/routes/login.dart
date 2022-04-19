import 'package:firebase_auth/firebase_auth.dart';
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

class _LoginPageState extends State<LoginPage> {
  Future<void> advanceAlertDialog(String message) {
    return Get.defaultDialog(
      title: 'Invalid Input',
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('OK !'),
        )
      ],
      contentPadding: EdgeInsets.all(15.0),
    );
  }

  Future<String?> signInMethod() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: takeEmail, password: takePassword);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return error.message;
    } catch (error) {
      return error.toString();
    }
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });
    String? result = await signInMethod();
    if (result != 'ok') {
      advanceAlertDialog(result!);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // must be fixed
      Get.snackbar('Successful', 'Login Successfully !',
          backgroundColor: Colors.greenAccent,
          icon: Icon(Icons.check_circle),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  bool isLoading = false;
  String takeEmail = '';
  String takePassword = '';

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
                    onChanged: (value) {
                      takeEmail = value;
                    },
                    checkPassword: false,
                  ),
                  CustomInput(
                    hintText: 'Enter Your Password ...',
                    onChanged: (value) {
                      takePassword = value;
                    },
                    checkPassword: true,
                  ),
                  CustomButton(
                    text: 'Login',
                    onTap: () {
                      signIn();
                    },
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
