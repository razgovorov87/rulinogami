import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              Text(
                'Привет,\n' + user.displayName + '!',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL),
                  ),
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
                        courseWidget(
                          'Базовый уровень',
                          'img1',
                          Color(0xFFD9FFCA),
                        ),
                        SizedBox(height: 20),
                        courseWidget(
                          'Трюки',
                          'img2',
                          Color(0xFFD9FFCA),
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
                        courseWidget(
                          'Продвинутый уровень',
                          'img3',
                          Color(0xFFD9FFCA),
                        ),
                        SizedBox(height: 20),
                        courseWidget(
                          'Прыжки',
                          'img4',
                          Color(0xFFD9FFCA),
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

  Container courseWidget(String title, String imgPath, Color bgColor) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: GestureDetector(
        onTap: () {
          if (title == 'Базовый уровень') {
            openCoursePage('$title', '$imgPath');
          }
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

  void openCoursePage(String title, String img) {
    Navigator.pushNamed(
      context,
      '/coursePage',
      arguments: {'title': '$title', 'img': '$img'},
    );
  }
}
