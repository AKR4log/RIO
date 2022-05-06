import 'package:flutter/material.dart';
import 'package:rio/service/api/method/get/get_data_user.dart';

import '../home.dart';

class ComfirmCard extends StatefulWidget {
  const ComfirmCard({Key key}) : super(key: key);

  @override
  State<ComfirmCard> createState() => _ComfirmCardState();
}

class _ComfirmCardState extends State<ComfirmCard> {
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
            alignment: Alignment.center,
            child: Container(
              width: 315,
              height: 419,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              child: Column(children: [
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 51, bottom: 56),
                    child: Image.asset('assets/img/logo.jpg',
                        height: 59, width: 159)),
                Container(
                  width: 273,
                  margin: const EdgeInsets.only(bottom: 18, left: 20),
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
                                  snapshot.data,
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
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(left: 23, bottom: 11),
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
                        'ДА - ЭТО МОЯ КАРТА',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home())),
                    )),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
