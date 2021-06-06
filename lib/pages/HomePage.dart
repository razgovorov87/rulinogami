import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rulinogami/pages/LoginPage.dart';
import 'package:rulinogami/provider/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              return HomeWidget();
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }

  Widget buildLoading() => Center(child: CircularProgressIndicator());
}

class HomeWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL),
                  ),
                ),
              ),
              Text(
                user.displayName,
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              IconButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
            'Роллер-школа \n«Рули ногами»',
            style: TextStyle(
                fontSize: 35, height: 1.3, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CourseWidget(
                          'Базовый уровень',
                          'img1',
                          Color(0xFFD9FFCA),
                          'DqZmKxGe3ZRT8lzjA6j4',
                        ),
                        SizedBox(height: 20),
                        CourseWidget(
                          'Слалом',
                          'img2',
                          Color(0xFFD9FFCA),
                          '0pWjgVvSTR72SUWeZ8xU',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: 30),
                        CourseWidget(
                          'Слайды',
                          'img3',
                          Color(0xFFD9FFCA),
                          'RCEV0HEcdcZiXveayOdZ',
                        ),
                        SizedBox(height: 20),
                        CourseWidget(
                          'Прыжки',
                          'img4',
                          Color(0xFFD9FFCA),
                          'bu517rH6skFighJ0aPIF',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.subscriptions,
                    color: Colors.green,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/shedule');
                  },
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/team');
                  },
                  icon: Icon(
                    Icons.groups,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseWidget extends StatelessWidget {
  late String title;
  late Color bgColor;
  late String imgPath;
  late String id;

  CourseWidget(this.title, this.imgPath, this.bgColor, this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/coursePage',
            arguments: {'title': '$title', 'img': '$imgPath', 'id': '$id'},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '$title',
              style: TextStyle(color: Colors.green, fontSize: 18, height: 1),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Container(
                  height: 4,
                  width: 100,
                  color: Colors.green,
                ),
                Expanded(
                  child: Container(
                    height: 4,
                    color: Colors.green.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Hero(
              tag: '$imgPath',
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/$imgPath.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
