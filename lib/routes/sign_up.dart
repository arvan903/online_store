import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'const.dart';

class SingUP extends StatefulWidget {
  SingUP({Key? key}) : super(key: key);

  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {
  bool isLoading = false;

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
                ),
                CustomInput(
                  hintText: 'Enter Your Password ...',
                ),
                CustomButton(
                  text: 'Create Account',
                  loading: isLoading,
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });
                    // Get.defaultDialog(
                    //   title: 'Invalid Input',
                    //   content: Text('Please Enter Email and password'),
                    //   actions: [
                    //     ElevatedButton(
                    //       onPressed: () => Get.back(),
                    //       child: Text('OK !'),
                    //     )
                    //   ],
                    //   contentPadding: EdgeInsets.all(15.0),
                    // );
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
