import 'dart:async';

import 'package:flutter/material.dart';

import '../HomePage/HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: InkWell(onTap: () {
          Navigator.of(context).pushNamed('/qt');
        },
          child: Container(
            height: height * double.infinity,
            width:  width * double.infinity,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/img/splash.jpg'),fit: BoxFit.cover
            )),
          ),
        ),
      ),
    );
  }
}
