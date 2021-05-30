import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:table_calendar/table_calendar.dart';

class ShedulePage extends StatefulWidget {
  @override
  _ShedulePageState createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  late CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Выберите дату',
          style: TextStyle(color: Colors.white),
        ),
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
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: _calendarController,
            initialCalendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            formatAnimation: FormatAnimation.slide,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
              leftChevronIcon: Icon(
                Icons.arrow_back_ios,
                size: 17,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios,
                size: 17,
                color: Colors.white,
              ),
              leftChevronMargin: EdgeInsets.only(left: 70),
              rightChevronMargin: EdgeInsets.only(right: 70),
            ),
            calendarStyle: CalendarStyle(
              weekendStyle: TextStyle(color: Colors.white),
              weekdayStyle: TextStyle(color: Colors.white),
              todayColor: Colors.grey,
              selectedColor: Colors.white,
              selectedStyle: TextStyle(color: Colors.black),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.white),
              weekdayStyle: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    dayLesson('10:00', 'Даниил Рубцов', '1000'),
                    dayLesson('12:00', 'Иван Иванов', '1200'),
                    dayLesson('14:00', 'Никита Стрельцов', '500'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row dayLesson(String time, String name, String price) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, right: 10),
          width: MediaQuery.of(context).size.width * 0.17,
          child: Text(
            time,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color(0xffe3ffde),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Text(
                  'Индивидуальная тренировка',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      '90 минут',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Рейтинг',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.green),
                    Icon(Icons.star, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.call, color: Colors.green),
                    SizedBox(width: 5),
                    Text(
                      '8 (900) 123 45-67',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      '$price ₽',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
