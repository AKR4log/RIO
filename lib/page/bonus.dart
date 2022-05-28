import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rio/page/home.dart';
import 'package:rio/page/qr_code.dart';
import 'package:rio/page/ruble.dart';
import 'package:rio/service/api/method/get/get_bonus.dart';
import 'package:rio/service/api/method/get/get_data_user.dart';
import 'package:rio/service/component/bottom_bar.dart';

class Bonus extends StatefulWidget {
  const Bonus({Key key}) : super(key: key);

  @override
  State<Bonus> createState() => _BonusState();
}

class _BonusState extends State<Bonus> {
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.only(top: 50),
              height: 603,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, "/Ruble"),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromRGBO(233, 233, 233, 1)),
                          height: 50,
                          child: const Center(
                              child: Icon(
                            Icons.close_rounded,
                            size: 28,
                            color: Color.fromRGBO(158, 158, 158, 1),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 273,
                  height: 156,
                  margin: const EdgeInsets.only(bottom: 15),
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
                      const Text(
                        'баллов на карте',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: FutureBuilder<dynamic>(
                    future: gets_bonus_user("0"),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (BuildContext c, int i) {
                          var item = snapshot.data['data'][i];
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 21),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        margin: EdgeInsets.only(right: 10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color.fromRGBO(
                                                166, 215, 158, 1)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.add_rounded,
                                          color: Colors.white,
                                          size: 32,
                                        )),
                                      ),
                                      Text(
                                        item['points'].toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item['date'].toString().substring(0, 10),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(161, 161, 161, 1),
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(top: 26, bottom: 8),
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
                        'СКАНИРОВАТЬ ЧЕК',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QrCode())),
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
                        onPressed: () =>
                            Navigator.pushNamed(context, "/HomePage"),
                        child: bar(Icons.credit_card, 'Карта', false)),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/Ruble"),
                      child:
                          bar(Icons.card_giftcard_outlined, 'РиоРублики', true),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {},
                      child:
                          bar(Icons.favorite_border_outlined, 'Акции', false),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                        onPressed: () {},
                        child:
                            bar(Icons.shopping_cart_outlined, 'Товары', false)),
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
