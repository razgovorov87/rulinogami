import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  List<Instructor> instructors = [
    Instructor(
        'Рубцов Даниил', '+79609447688', 'daniilrubtsov', 'daniil_Rubtsov'),
    Instructor(
        'Повельев Владислав', '+79237278044', 'v_povelyev', 'instructor1'),
    Instructor(
        'Евтушенко Николай', '+79831828985', 'kolkaevtushenko', 'instructor2'),
  ];

  @override
  Widget build(BuildContext context) {
    var stream = FirebaseFirestore.instance.collection('team').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Наши инструктора'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: StreamBuilder(
          stream: stream,
          builder: (BuildContext, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.length == 0) {
                    return Center(
                      child: Text('В базе данных нет инструкторов'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, int index) {
                        final item = snapshot.data!.docs[index].data();
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/image/${item['photo']}.jpg'),
                          ),
                          title: Text(item['name']),
                          subtitle: Text('@' + item['instagram']),
                          trailing: TextButton(
                            onPressed: () => launch('tel::${item['phone']}'),
                            child: Icon(Icons.phone, color: Colors.green),
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return Center(child: Text('Произошла ошибка!'));
                }
            }
            ;
          },
        ),
      ),
    );
  }
}

class Instructor {
  final String name;
  final String phone;
  final String instagram;
  final String photo;

  Instructor(this.name, this.phone, this.instagram, this.photo);
}
