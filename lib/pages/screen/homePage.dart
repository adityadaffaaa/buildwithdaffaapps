import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/carouselHomePage.dart';
import 'package:flutter_buildwithdaffa/components/courseCard.dart';
import 'package:flutter_buildwithdaffa/components/listKategori.dart';
import 'package:flutter_buildwithdaffa/list/ListCardArtIntel.dart';
import 'package:flutter_buildwithdaffa/list/ListCardMobile.dart';
import 'package:flutter_buildwithdaffa/list/ListCardWeb.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestoreInst = FirebaseFirestore.instance;
    CollectionReference user = firestoreInst.collection('user');
    final auth = FirebaseAuth.instance.currentUser!.email;
    Widget top() {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 42,
                      color: primary,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    StreamBuilder<DocumentSnapshot>(
                      stream: user.doc(auth).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        if (!snapshot.hasData) {
                          return Text('Loading...');
                        }
                        return Text(
                          "Hallo, ${snapshot.data!['full name']}",
                          style: paragraph1.copyWith(color: primary),
                        );
                      },
                    )
                  ],
                ),
                Image.asset(
                  'assets/img/logobwd.png',
                  height: 32,
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            SizedBox(
              width: 200,
              child: Text(
                'What you want to Learn Today?',
                style: heading2.copyWith(color: primary),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            ListKategori(),
          ],
        ),
      );
    }

    Widget MostPopular() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: paragraph1.copyWith(color: primary),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: paragraph2.copyWith(color: primary),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            CarouselHomePage()
          ],
        ),
      );
    }

    Widget webDev() {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Web Development',
                  style: paragraph1.copyWith(color: primary),
                ),
                InkWell(
                    onTap: () {},
                    child: Text('View All',
                        style: paragraph2.copyWith(color: primary)))
              ],
            ),
            SizedBox(
              height: 14,
            ),
            ListCardWeb()
          ],
        ),
      );
    }

    Widget mobileDev() {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mobile Development',
                  style: paragraph1.copyWith(color: primary),
                ),
                InkWell(
                    onTap: () {},
                    child: Text('View All',
                        style: paragraph2.copyWith(color: primary)))
              ],
            ),
            SizedBox(
              height: 14,
            ),
            ListCardMobile()
          ],
        ),
      );
    }

    Widget artIntel() {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Artificial Intelligence',
                  style: paragraph1.copyWith(color: primary),
                ),
                InkWell(
                    onTap: () {},
                    child: Text('View All',
                        style: paragraph2.copyWith(color: primary)))
              ],
            ),
            SizedBox(
              height: 14,
            ),
            ListCardArtIntel()
          ],
        ),
      );
    }

    return ListView(
      children: [top(), MostPopular(), webDev(), mobileDev(), artIntel()],
    );
  }
}
