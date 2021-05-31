import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rulinogami/main.dart';
import 'package:rulinogami/pages/HomePage.dart';
import 'package:rulinogami/provider/google_sign_in.dart';
import 'package:rulinogami/widget/sign_up_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            final provider = Provider.of<GoogleSignInProvider>(context);

            if (provider.isSigningIn) {
              return buildLoading();
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return SignUpWidget();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}
