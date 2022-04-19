import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'const.dart';
import 'login.dart';

class SingUP extends StatefulWidget {
  SingUP({Key? key}) : super(key: key);

  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {
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

  Future<String?> signUpMethod() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: takeEmail, password: takePassword);
      return 'ok';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return 'the password is too week';
      } else if (error.code == 'email-already-in-use') {
        return 'The account with this email is already exist !';
      }
      return error.message;
    } catch (error) {
      return error.toString();
    }
  }

  void signUp() async {
    setState(() {
      isLoading = true;
    });
    String? result = await signUpMethod();
    if (result != 'ok') {
      advanceAlertDialog(result!);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Get.to(LoginPage());
      Get.snackbar('Successful', 'Account Created !',
          backgroundColor: Colors.greenAccent, icon: Icon(Icons.check_circle));
    }
  }

  bool isLoading = false;
  String takeEmail = '';
  String takePassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Create a New Account !',
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
                  text: 'Create Account',
                  loading: isLoading,
                  onTap: () {
                    signUp();
                  },
                  mode: false,
                )
              ],
            ),
            CustomButton(
              text: 'Back to Login',
              onTap: () => Get.back(),
              mode: true,
              loading: isLoading,
            )
          ],
        ),
      ),
    );
  }
}
