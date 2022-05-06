// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:rio/page/ruble.dart';
import 'package:rio/service/api/method/get/get_data_user.dart';
import 'package:rio/service/component/bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  margin: const EdgeInsets.only(bottom: 18),
                  height: 156,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: const Color.fromRGBO(245, 245, 245, 1)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 36, bottom: 10),
                        child: const Text(
                          'Номер карты',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      FutureBuilder<String>(
                        future: get_data_card_user(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
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
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                );
                              }
                          }
                        },
                      )
                    ],
                  ),
                ),
                Container(
                    width: 273,
                    height: 175,
                    margin: const EdgeInsets.only(top: 27),
                    child: const Text(
                      'Карта лучшего друга\nпозволяет приобретать товары со скидкой 5% от розничной цены, также\nучаствовать во всех акциях Рио и покупать товары по\nоптовым ценам',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ))
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
                        onPressed: () {},
                        child: bar('assets/img/bar-1.png', 'Карта', true)),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Ruble())),
                      child: bar('assets/img/bar-2.png', 'РиоРублики', false),
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
