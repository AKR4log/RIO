import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rio/service/api/method/comfirm.dart';

class ComfirmPhone extends StatefulWidget {
  final String numberPhone;
  const ComfirmPhone({Key key, this.numberPhone}) : super(key: key);

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
                    margin: const EdgeInsets.only(top: 38, bottom: 38),
                    child: SvgPicture.asset(
                      'assets/img/logo.svg',
                      height: 75,
                      width: 159,
                      fit: BoxFit.fitHeight,
                    )),
                Container(
                    height: 24,
                    width: 260,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: const Text(
                      '?????? ?????? ??????????????????????',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black),
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 23),
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
                          fillColor: Colors.white),
                      keyboardType: TextInputType.number,
                    )),
                Container(
                    width: 270,
                    height: 62,
                    margin: const EdgeInsets.only(bottom: 11),
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
                        '??????????????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () => check_code(widget.numberPhone,
                          controllerPhone.text.trim(), context),
                    )),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
