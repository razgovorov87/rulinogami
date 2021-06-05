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
    return Scaffold(
      appBar: AppBar(
        title: Text('Наши инструктора'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView.builder(
          itemCount: instructors.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/image/${instructors[index].photo}.jpg'),
              ),
              title: Text(instructors[index].name),
              subtitle: Text(instructors[index].phone),
              trailing: TextButton(
                onPressed: () => launch('tel::${instructors[index].phone}'),
                child: Icon(Icons.phone, color: Colors.green),
              ),
            );
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
