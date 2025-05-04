import 'package:flutter/material.dart';
import 'package:deimos/play_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3),
                          ])),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PlayAnimationWidget(
                              delay: 1,
                              child: Text(
                                'DEIMOS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                PlayAnimationWidget(
                                  delay: 1.2,
                                  child: Text(
                                    'Штурмовик',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                PlayAnimationWidget(
                                  delay: 1.2,
                                  child: Text(
                                    'в Rainbow Six Siege',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PlayAnimationWidget(
                          delay: 1.6,
                          child: Text(
                            'Миниатюрный трекер находит цель, а затем раскрывает ее местоположение оперативнику Deimos, причем цель тоже узнает его местоположение. Во время выслеживания Deimos может использовать только свое особое оружие – .44 Vendetta, так что преследование для него – личное дело.',
                            style: TextStyle(
                              color: Colors.white,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const PlayAnimationWidget(
                          delay: 1.6,
                          child: Text(
                            'Роль',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            PlayAnimationWidget(
                              delay: 1.6,
                              child: Text(
                                'РАЗВЕДКА/КОНТРОЛЬ КАРТЫ',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const PlayAnimationWidget(
                          delay: 1.6,
                          child: Text(
                            'ВИДЕО',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PlayAnimationWidget(
                          delay: 1.6,
                          child: SizedBox(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                makeVideoWodget(
                                    imagePath: 'assets/images/3.gif'),
                                makeVideoWodget(
                                    imagePath: 'assets/images/2.gif'),
                                makeVideoWodget(
                                    imagePath: 'assets/images/4.gif'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PlayAnimationWidget(
                delay: 2,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 46, 43, 43),
                  ),
                  child: const Align(
                    child: Text(
                      'Vendetta .44',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget makeVideoWodget({imagePath}) {
  return AspectRatio(
    aspectRatio: 1.5 / 1,
    child: Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.3),
            ],
          ),
        ),
        child: const Align(
          child: Icon(
            Icons.play_circle,
            color: Colors.white,
            size: 70,
          ),
        ),
      ),
    ),
  );
}
