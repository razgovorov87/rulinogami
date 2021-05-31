import 'package:flutter/material.dart';
import 'package:rulinogami/widget/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Column(
        children: [
          Spacer(),
          Center(
            child: GoogleSignUpButtonWidget(),
          ),
          Spacer(),
        ],
      );
}
