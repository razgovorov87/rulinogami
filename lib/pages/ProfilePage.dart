import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rulinogami/pages/LoginPage.dart';
import 'package:rulinogami/provider/google_sign_in.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL),
            ),
            SizedBox(height: 8),
            Text(
              'Имя: ' + user.displayName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            // ElevatedButton(
            //   onPressed: () {
            //     final provider =
            //         Provider.of<GoogleSignInProvider>(context, listen: false);
            //     provider.logout();
            //     Navigator.pushNamed(context, '/login');
            //   },
            //   child: Text('Выйти из аккаунта'),
            // ),
          ],
        ),
      ),
    );
  }
}
