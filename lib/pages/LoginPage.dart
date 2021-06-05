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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffa8e063),
              Color(0xff56ab2f),
            ]),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 110, 15, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Роллер-школа',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '«Рули ногами»',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/img1.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SignUpWidget(),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(50)),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text('или'),
                      SizedBox(width: 15),
                      Expanded(
                        child: Container(
                          height: 1,
                          decoration:
                              BoxDecoration(color: Colors.black.withAlpha(50)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/vk.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/facebook.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/instagram.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
