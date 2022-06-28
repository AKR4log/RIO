import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rio/page/home.dart';
import 'package:rio/page/ruble.dart';
import 'package:rio/service/api/method/get/get_catalogy_gift.dart';
import 'package:rio/service/component/bottom_bar.dart';

class CatGift extends StatefulWidget {
  const CatGift({Key key}) : super(key: key);

  @override
  State<CatGift> createState() => _CatGiftState();
}

class _CatGiftState extends State<CatGift> {
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
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                Expanded(
                  child: FutureBuilder<dynamic>(
                    future: gets_catalogy_gift_user("0"),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container();
                      }

                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 217,
                                childAspectRatio: 1),
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (BuildContext c, int i) {
                          var item = snapshot.data['data'][i];
                          return Container(
                              margin: const EdgeInsets.all(1),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color:
                                      const Color.fromRGBO(245, 245, 245, 1)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        width: 136,
                                        height: 145,
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Image.network(
                                          item['img_url'],
                                          fit: BoxFit.fitHeight,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            item['name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            item['description'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    106, 106, 106, 1)),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              item['price'].toString(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            const Text(
                                              'PP',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );
                    },
                  ),
                ),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 360,
              height: 85,
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
