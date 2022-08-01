import 'dart:math';

import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: (pi / 4),
          origin: Offset(0, 0),
          child: Container(
              width: 100,
              height: 100,
              decoration:
                  const BoxDecoration(color: Colors.black),
              child: Container(
                margin: EdgeInsets.all(5),
                child: FloatingActionButton(
                  splashColor:
                      const Color.fromARGB(150, 196, 13, 0),
                  backgroundColor: Colors.black,
                  child: Transform.rotate(
                    angle: -(pi / 4),
                    child: const Icon(
                      Icons.home,
                      color:
                          Color.fromARGB(150, 196, 13, 0),
                      size: 50,
                    ),
                  ),
                  onPressed: () {},
                ),
              )),
        ),
      ],
    );
  }
}
