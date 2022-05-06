import 'package:flutter/material.dart';
import 'package:rio/page/home.dart';
import 'package:rio/service/api/method/get/get_data_user.dart';
import 'package:rio/service/component/bottom_bar.dart';

class Ruble extends StatefulWidget {
  const Ruble({Key key}) : super(key: key);

  @override
  State<Ruble> createState() => _RubleState();
}

class _RubleState extends State<Ruble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/img/background.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 315,
              margin: const EdgeInsets.only(top: 50),
              height: 603,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              child: Column(children: [
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 38, bottom: 38),
                    child: Image.asset('assets/img/logo.jpg',
                        height: 59, width: 159)),
                Container(
                  width: 273,
                  height: 156,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromRGBO(245, 245, 245, 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder<dynamic>(
                        future: get_data_balance_user(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            default:
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text(
                                  snapshot.data.toString(),
                                  style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                );
                              }
                          }
                        },
                      ),
                      Container(
                        child: const Text(
                          'баллов на карте',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(top: 73, bottom: 8),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 240, 0, 1)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: const Text(
                        'ОПИСАНИЕ АКЦИИ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () {},
                    )),
                Container(
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 240, 0, 1)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: const Text(
                        'БОНУСНЫЕ БАЛЛЫ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () {},
                    )),
                Container(
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(bottom: 25),
                    child: TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(31),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 240, 0, 1)),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: const Text(
                        'КАТАЛОГ ПОДАРКОВ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () {},
                    )),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 360,
              height: 125,
              color: const Color.fromRGBO(245, 245, 245, 1),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home())),
                        child: bar('assets/img/bar-1.png', 'Карта', false)),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      onPressed: () {
                        return null;
                      },
                      child: bar('assets/img/bar-2.png', 'РиоРублики', true),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child: bar('assets/img/bar-3.png', 'Акции', false),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                        onPressed: () {},
                        child: bar('assets/img/bar-4.png', 'Товары', false)),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
