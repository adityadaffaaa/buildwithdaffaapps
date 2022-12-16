import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      FirebaseAuth.instance.currentUser == null
          ? Navigator.pushNamed(context, '/introduction')
          : Navigator.pushReplacementNamed(context, '/mainScreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 116),
        child: Image(
          image: AssetImage('assets/img/logobwd.png'),
          height: 70,
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Text(
          '© 2022 Build With Daffa',
          style: paragraph2.copyWith(color: primary),
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: primary,
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: primary),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(350))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [body(), footer()],
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
