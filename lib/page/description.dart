import 'package:flutter/material.dart';
import 'package:rio/page/home.dart';
import 'package:rio/page/ruble.dart';

import '../service/component/bottom_bar.dart';

class Description extends StatefulWidget {
  const Description({Key key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
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
                const Text(
                  'НЕБЫВАЛАЯ АКЦИЯ 😍\nПодарки каждому покупателю РИО 👍\n\n✅ При совершении покупок на каждые 500₽ в чеке получайте по 25 РИО - рубликов\n✅ Копите РИО-рублики и обменивайте их на угощения или текстильные подарки\n\n🎁 Среди подарков:\n- Хрустящие круассаны\n- Ароматный кофе ☕\n- Фирменные лимонады\n- Уютные пледы, мягкие полотенца и другие текстильные подарки\n\n*акция действует только по будням\n',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )
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
