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
  late List<LessonRowData> lessonList = [];

  List<LessonRowData> lessonListBasicCourse = [
    LessonRowData(
        'Правильная разминка\nдля роллера',
        'Во время разминки делаются следующие упражнения:\n\n1) Повороты головы вверх-вниз, влево-вправо;\n\n2) Вращение руками вперед и назад;\n\n3) Повороты и наклоны корпуса;\n\n4) Вращение коленей\n\n5) Вращение голеностопа',
        'https://www.youtube.com/watch?v=PX6PIk0vAZA&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=36'),
    LessonRowData(
        'Основы катания на роликах',
        'Роллер катается в основном на полусогнутых коленях. Колени нужно сгибать так, чтобы при взгляде на носки, мы не видели собственных роликов.\n\nНе допускается катание на прямых коленях!\n\nПравильная стойка включает катание на внешнем ребре ролика. Для этого нужно выгнуть голеностоп так, чтобы его внутренняя часть касалась ролика, а внешняя не касалась.',
        'https://www.youtube.com/watch?v=uQHKc6drznU&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=13'),
    LessonRowData(
        'Учимся правильно падать\nна роликах',
        'Роллер должен кататься в защитном комплекте (колени, локти, на запястье, шлем) Падение происходит в основном вперед, на защиту. Сначала пола касаются колени, затем руки. Если чувствуете, что вас качает назад и вы можете упасть на спину, то необходимо резко присесть на корточки и обхватить руками колени. Так вы снизите центр тяжести и падение будет не так болезненно. А может и вовсе устоите на роликах.',
        'https://www.youtube.com/watch?v=zzYbAsu_UWY'),
    LessonRowData(
        'Учим «Самокат»',
        'Для правильного выполнения «самоката» необходимо поставить одну ногу (опорная) в прямом направлении, вторую (толчковая) повернуть слегка в сторону. Чтобы начать движение, нужно слегка надавить на пятку толчковой ноги, при этом опорная нога должна быть впереди. Когда нога поедет в сторону, удерживаем равновесие на опорной ноге, далее возвращаем толчковую ногу в исходное положение. Повторяем данное движение.',
        'https://www.youtube.com/watch?v=bC-qttsVDkA&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=15'),
    LessonRowData(
        'Учим «фонарик»',
        'Для выполнения упражнения «фонарик» нужно встать в исходное положение: пятки вместе, носки врозь. Далее из этой стойки мы двигаемся вперед, разводя ноги в стороны. Как только ноги разводятся шире плеч, мы начинаем сводить носочки вместе. Для этого слегка надавим на пятки и усилием голеностопа будем поворачивать носочки внутрь.',
        'https://www.youtube.com/watch?v=Hyd4o0Yi9I0&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=14'),
    LessonRowData(
        'Учимся тормозить «фонариком»',
        'Для торможения «фонариком» на роликах, нужно уметь делать сам «фонарик». Чтобы остановиться, необходимо сначала развести широко ноги, как в фонарике, затем повернуть носки внутрь. Ролики начнут сближаться и могут врезаться друг в друга, из-за чего произойдет падение роллера. Чтобы это миновать, необходимо напрячь мышц ног и не дать нашим роликам врезаться. За счет контр-действия, возникает трение колес об поверхность и мы останавливаемся',
        'https://www.youtube.com/watch?v=Xg7lDk8aQtg&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=16'),
    LessonRowData(
        'Учимся правильно поворачивать\nна роликах',
        'Поворачивать необходимо в стойке «разножка», когда у нас одна нога стоит впереди второй. Поворот осуществляем за счет наклона всего тела и поворота носков роликов.',
        'https://www.youtube.com/watch?v=N_YkFWJKeMk&list=PLw5lYhpNMf1BZx3HsVo0UFWS5TYqeCo_i&index=12'),
  ];

  List<LessonRowData> lessonListSlalom = [
    LessonRowData(
        'Крисс-кросс',
        'Начинаем делать упражнение фонарик, когда носки сведутся вместе, ведем одну ногу дальше вперед. Как только поравнялась пятка с носком, начинаем движение второй ногой. Далее скрешиваем и ставим ролики прямо.',
        'https://www.youtube.com/watch?v=TcvZBXN5PzY&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n'),
    LessonRowData(
        'Крисс-кросс спиной',
        'Начинаем делать упражнение фонарик, когда носки сведутся вместе, ведем одну ногу дальше вперед. Как только поравнялась пятка с носком, начинаем движение второй ногой. Далее скрешиваем и ставим ролики прямо.',
        'https://www.youtube.com/watch?v=1mVwRPzUnEE&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=5'),
    LessonRowData(
        'Монолайн',
        'Набираем среднюю скорость, начинаем делать фонарик, и в конце выводим одну ногу вперед, перед вторым роликом. Держим ролики в одну линию.',
        'https://www.youtube.com/watch?v=m3fpe19riXY&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=4'),
    LessonRowData(
        'Монолайн спиной',
        'Набираем среднюю скорость, начинаем делать фонарик, и в конце выводим одну ногу вперед, перед вторым роликом. Держим ролики в одну линию.',
        'https://www.youtube.com/watch?v=y12pOfATqfk&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=6'),
    LessonRowData(
        'Ванфут',
        'Набираем среднюю скорость, ставим ролики рядом друг с другом. Переносим вес тела на одну ногу, вторую поднимаем в воздух. Едем на одной ноге, удерживая равновесие.',
        'https://www.youtube.com/watch?v=DEg38saFm9Y&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=7'),
    LessonRowData(
        'Грейпвайн',
        'Связка из двух крисс-кроссов. Сначала делаем лицом вперед через 1 конус, останавливаемся в положении галочка. Затем делаем спиной вперед, останавливаемся в положениие обратная галочка.',
        'https://www.youtube.com/watch?v=KgCF6IhQFvk&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=8'),
    LessonRowData(
        'Мабрук',
        'Связка из 4 элементов: крисс-кросс лицом и спиной и два разворота через галочку. Начинаем делать крисс-кросс лицом вперед, останавливаемся в положении галочка, делаем разворот, далее крисс-кросс спиной и снова разворот. Дальше данный цикл повторяется.',
        'https://www.youtube.com/watch?v=D8Ab2a2p3Yo&list=PLw5lYhpNMf1AV48Kve5bP_NELJ2_YpK2n&index=22'),
  ];

  List<LessonRowData> lessonListJumps = [
    LessonRowData('ZOULOU JUMP', '',
        'https://www.youtube.com/watch?v=ZCWiwJyYKn8&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY'),
    LessonRowData('PAPILLON JUMP', '',
        'https://www.youtube.com/watch?v=w3ZJLG8dmQc&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY&index=2'),
    LessonRowData('KARATE JUMP', '',
        'https://www.youtube.com/watch?v=-euYQhDAFEI&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY&index=3'),
    LessonRowData('FRONT MUTE JUMP', '',
        'https://www.youtube.com/watch?v=lmj9QeYLSeA&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY&index=4'),
    LessonRowData('DRAGON Shifty FS JUMP', '',
        'https://www.youtube.com/watch?v=WCP-nlOItF8&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY&index=5'),
    LessonRowData('FRONT JUMP', '',
        'https://www.youtube.com/watch?v=4--cDoxdcgs&list=PLlqlJKHZK86rjnU2vI2QX9ZP3vsxXtUjY&index=6'),
  ];

  List<LessonRowData> lessonListSlides = [
    LessonRowData('ACID SLIDE', '',
        'https://www.youtube.com/watch?v=S0ZSDhUfo_Y&list=PLlqlJKHZK86rScQ7_cTDFiK7qCOeH4q68'),
    LessonRowData('POWERSLIDE', '',
        'https://www.youtube.com/watch?v=X90Mzh6WlKk&list=PLlqlJKHZK86rScQ7_cTDFiK7qCOeH4q68&index=2'),
    LessonRowData('SNOWPLOW SLIDE', '',
        'https://www.youtube.com/watch?v=7QIWN0ztGP4&list=PLlqlJKHZK86rScQ7_cTDFiK7qCOeH4q68&index=3'),
    LessonRowData('SOUL SLIDE', '',
        'https://www.youtube.com/watch?v=JlSsxhXcP5I&list=PLlqlJKHZK86rScQ7_cTDFiK7qCOeH4q68&index=4'),
    LessonRowData('PORNSTAR SLIDE', '',
        'https://www.youtube.com/watch?v=b5jP2-jGnDE&list=PLlqlJKHZK86rScQ7_cTDFiK7qCOeH4q68&index=5'),
  ];

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    if (chosenTitle == 'Базовый уровень') {
      lessonList = lessonListBasicCourse;
    } else if (chosenTitle == 'Слалом') {
      lessonList = lessonListSlalom;
    } else if (chosenTitle == 'Прыжки') {
      lessonList = lessonListJumps;
    } else if (chosenTitle == 'Слайды') {
      lessonList = lessonListSlides;
    }

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
              child: SingleChildScrollView(
                child: Column(
                    children:
                        lessonList.map((e) => productListing(el: e)).toList()),
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
            Column(
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
