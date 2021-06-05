import 'package:flutter/material.dart';
import 'package:rulinogami/pages/CoursePage.dart';
import 'package:rulinogami/pages/HomePage.dart';
import 'package:rulinogami/pages/LessonPage.dart';
import 'package:rulinogami/pages/LoginPage.dart';
import 'package:rulinogami/pages/ProfilePage.dart';
import 'package:rulinogami/pages/ShedulePage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:rulinogami/pages/TeamPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruli Nogami',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/coursePage': (context) => CoursePage(),
        '/lessonPage': (context) => LessonPage(),
        '/shedule': (context) => ShedulePage(),
        '/profile': (context) => ProfilePage(),
        '/team': (context) => TeamPage(),
      },
    );
  }
}
