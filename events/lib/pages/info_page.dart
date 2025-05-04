import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:event/util/play_animation_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext content) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 200, 200),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Практическая работа №3',
          style: TextStyle(color: const Color.fromARGB(255, 33, 50, 58)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: Icon(
          Icons.menu,
          color: const Color.fromARGB(255, 33, 50, 58),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/6.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(15, -15),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: const Color.fromARGB(255, 194, 194, 194)),
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical:5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 155, 155, 155),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: 'Найти событие',
                  hintStyle: TextStyle(color: Colors.black,),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            PlayAnimationWidget(
              delay: 1.2,
              child: makeItemWidget(
                imagePath: 'assets/images/2.png',
                date: 26,
                month: 'ИЮН',
                time: '6:00',
                name: 'Тизер события "Боевые души"',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PlayAnimationWidget(
              delay: 1.3,
              child: makeItemWidget(
                imagePath: 'assets/images/1.png',
                date: 19,
                month: 'ЯНВ',
                time: '10:00',
                name: 'Лунный пир 2022: изменения в заданиях события',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PlayAnimationWidget(
              delay: 1.4,
              child: makeItemWidget(
                imagePath: 'assets/images/3.png',
                date: 11,
                month: 'МАЙ',
                time: '10:00',
                name:
                    'Подробности о событии ''Импульсный Огонь 2020''',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PlayAnimationWidget(
              delay: 1.5,
              child: makeItemWidget(
                imagePath: 'assets/images/4.png',
                date: 26,
                month: 'МАР',
                time: '10:00',
                name: 'Трейлер события ''Галактики 2020''',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PlayAnimationWidget(
              delay: 1.6,
              child: makeItemWidget(
                imagePath: 'assets/images/5.png',
                date: 20,
                month: 'ДЕК',
                time: '10:00',
                name: 'Результаты события "Новый год 2020"',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}

Widget makeItemWidget({
  imagePath,
  date,
  month,
  time,
  name,
}) {
  return Row(
    children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Text(
              date.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 102, 102, 102),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              month,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      Expanded(
          child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.1)
            ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                name.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    ],
  );
}
