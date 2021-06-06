import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LessonRowData {
  final String title;
  final String desc;
  final String link;

  LessonRowData(this.title, this.desc, this.link);
}

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late String chosenImg;
  late String chosenTitle;
  late String chosenId;
  late List<LessonRowData> lessonList = [];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    chosenId = arguments['id'];
    var stream = FirebaseFirestore.instance
        .collection('courses/${chosenId}/lessons')
        .orderBy('lessonOrder')
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.green.shade900,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chosenTitle,
                        style: TextStyle(
                            color: Colors.green.shade700, fontSize: 22),
                      ),
                      Text(
                        'Даниил Рубцов',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFD9FFCA),
                  ),
                  child: Hero(
                    tag: chosenImg,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                          image: AssetImage('assets/image/$chosenImg.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Курс',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 6, right: 10, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffd7fad3),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.timer, color: Colors.green),
                        ),
                      ),
                      Text(
                        '1 час, 20 мин',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: stream,
                builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasData) {
                        if (snapshot.data!.docs.length == 0) {
                          return Center(
                            child: Text('Не удалось найти уроки этого курса'),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, int index) {
                              final e = snapshot.data!.docs[index].data();
                              LessonRowData item = LessonRowData(
                                  e['title'].toString(),
                                  e['description'],
                                  e['link']);
                              return productListing(el: item);
                            },
                          );
                        }
                      } else {
                        return Center(child: Text('Произошла ошибка!'));
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column productListing({required LessonRowData el}) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                // color: (activeOrInactive == 'active'
                //     ? Colors.green
                //     : Color(0xffd7fad3)),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: IconButton(
                onPressed: () {
                  openLessonPage(el.title, el.desc, el.link);
                },
                icon: Icon(
                  Icons.play_arrow,
                  // color: (activeOrInactive == 'active'
                  //     ? Colors.white
                  //     : Colors.green),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    el.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Описание',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void openLessonPage(String title, String desc, String link) {
    Navigator.pushNamed(
      context,
      '/lessonPage',
      arguments: {'title': '$title', 'desc': '$desc', 'link': '$link'},
    );
  }
}
