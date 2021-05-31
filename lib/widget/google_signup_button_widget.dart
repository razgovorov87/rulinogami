import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rulinogami/provider/google_sign_in.dart';

class GoogleSignUpButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlinedButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
        child: Text(
          'Авторизоваться через Google',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
