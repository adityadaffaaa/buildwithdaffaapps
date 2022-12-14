import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/button.dart';
import 'package:flutter_buildwithdaffa/pages/getStarted.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';

class introduction extends StatelessWidget {
  const introduction({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Container(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/img/book.png'),
              height: 238,
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              width: 184,
              child: Text(
                'Welcome to Build With Daffa👋',
                style: heading3.copyWith(color: background2),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Flexible(
          child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 45),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                  color: text2, borderRadius: BorderRadius.circular(8)),
            ),
            Column(
              children: [
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Adipiscing id turpis volutpat varius.',
                  style: paragraph1.copyWith(color: text2),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Adipiscing id turpis volutpat varius. Adipiscing id turpis volutpat varius. dolor sit amet consectetur.',
                  textAlign: TextAlign.center,
                  style: paragraph4.copyWith(color: text4),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/getStarted');
              },
              child: CustomBtn(
                bgcolor: secondary,
                text: 'Next',
                color: primary,
                borderColor: secondary,
              ),
            ),
            Text(
              "© 2022 Build With Daffa",
              style: paragraph2.copyWith(color: text2),
            )
          ],
        ),
      ));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          width: double.infinity,
          child: Column(
            children: [body(), footer()],
          ),
        ),
      ),
    );
  }
}
