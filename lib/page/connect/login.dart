import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:rio/service/api/method/auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                SizedBox(
                    width: 270,
                    height: 56,
                    child: TextField(
                        controller: controllerPhone,
                        style: const TextStyle(
                            color: Color.fromRGBO(140, 140, 140, 1),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                        decoration: InputDecoration(
                            prefixIcon: CountryCodePicker(
                              flagWidth: 25,
                              padding: const EdgeInsets.only(left: 23),
                              initialSelection: 'RU',
                              favorite: const ['+7', 'RU'],
                              countryFilter: const ['RU'],
                              textStyle: const TextStyle(
                                  color: Color.fromRGBO(140, 140, 140, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
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
                            contentPadding: const EdgeInsets.only(top: 4),
                            hintText: "(999) 999-99-99",
                            fillColor: Colors.white),
                        inputFormatters: [
                          MaskedInputFormatter('(###)###-##-##')
                        ],
                        keyboardType: TextInputType.phone)),
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
                        'ПОЛУЧИТЬ КОД',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color.fromRGBO(75, 66, 0, 1)),
                      ),
                      onPressed: () => auth_user(
                          '7' +
                              controllerPhone.text
                                  .trim()
                                  .replaceAll(RegExp(r'[^0-9]'), ''),
                          context),
                    )),
                Container(
                    height: 88,
                    width: 270,
                    margin: const EdgeInsets.only(bottom: 13),
                    child: const Text(
                      'Нажимая на кнопку, я соглашаюсь с условиями Правила пользования\nторговой площадкой',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color.fromRGBO(120, 120, 120, 1)),
                    ))
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
