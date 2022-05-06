import 'package:flutter/material.dart';
import 'package:rio/page/connect/confirm_card.dart';
import 'package:rio/service/component/icons.dart';

class ComfirmPhone extends StatefulWidget {
  const ComfirmPhone({
    Key key,
  }) : super(key: key);

  @override
  State<ComfirmPhone> createState() => _ComfirmPhoneState();
}

class _ComfirmPhoneState extends State<ComfirmPhone> {
  TextEditingController controllerPhone = TextEditingController();

  @override
  void initState() {
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerPhone?.dispose();
    super.dispose();
  }

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
                    height: 24,
                    width: 260,
                    margin: const EdgeInsets.only(left: 30, bottom: 16),
                    child: const Text(
                      'Код для авторизации',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 23, bottom: 23),
                    width: 270,
                    height: 56,
                    child: TextField(
                      controller: controllerPhone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(140, 140, 140, 1))),
                          filled: true,
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(200, 200, 200, 1),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                          hintText: "Код...",
                          fillColor: Colors.white),
                    )),
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
                        'ПОДТВЕРДИТЬ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ComfirmCard())),
                    )),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
