import 'package:book_store/Text_fields/number_text_fields.dart';
import 'package:book_store/common/MyButtonText.dart';
import 'package:book_store/common/Texts.dart';
import 'package:book_store/common/bordered_container.dart';
import 'package:book_store/common/snakBar.dart';
import 'package:book_store/services/backed_services/auth.dart';
import 'package:book_store/view/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:book_store/Text_fields/Text_field.dart';

class Signup extends StatelessWidget {
  Signup({
    Key? key,
  }) : super(key: key);

  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          child: Image.asset(
            'assets/images/book_store_logo1.png',
            width: 272.86,
            height: 204.65,
          ),
        ),
        Center(child: TextWidget(t: 'Sign Up', w: FontWeight.bold, c: Colors.black, z: 27)),
        Padding(
          padding: const EdgeInsets.only(left: 35, right: 25, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(t: 'Name        ', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextField(controller: name)),
              const SizedBox(height: 24),
              TextWidget(t: 'Phone Number', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextFieldnum(controller: phoneNumber)),
              const SizedBox(height: 24),
              TextWidget(t: 'Password       ', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextField(controller: password, isSecure: true)),
              const SizedBox(height: 24),
              TextWidget(t: 'Confirm Password       ', w: FontWeight.w500, c: Colors.grey[700], z: 18),
              SizedBox(height: 50, child: MyTextField(controller: confirmPassword, isSecure: true)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: TextButton(
            onPressed: () async {
              await AuthService().signUp(name.text, phoneNumber.text, password.text, confirmPassword.text);
              ScaffoldMessenger.of(context).showSnackBar(mySnackBar(message: AuthService.signUpMessage));
              await Future.delayed(const Duration(seconds: 1));
              if (AuthService.statusCode == 200) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
              }
            },
            child: const BorderedContainer(child: MyButtonText(text: 'Sign up')),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
              },
              child: TextWidget(t: 'Allready have an account?', w: FontWeight.normal, c: Color.fromARGB(255, 14, 132, 172), z: 16.5),
            ),
          ),
        )
      ]),
    ));
  }
}
