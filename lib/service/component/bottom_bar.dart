import 'package:flutter/material.dart';

Widget bar(String link, String name, bool useBar) {
  return SizedBox(
    height: 125,
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(link, width: 35, height: 35),
      const SizedBox(
        height: 13,
      ),
      Text(name,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: useBar
                  ? const Color.fromARGB(255, 216, 24, 31)
                  : Colors.black))
    ]),
  );
}
