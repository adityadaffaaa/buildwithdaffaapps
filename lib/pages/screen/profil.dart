import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/bodyProfile.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class profilPage extends StatelessWidget {
  const profilPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestoreInst = FirebaseFirestore.instance;
    CollectionReference user = firestoreInst.collection('user');
    final auth = FirebaseAuth.instance.currentUser!.uid;
    Widget top() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'My Profile',
            style: heading2.copyWith(color: primary),
          ),
          Image.asset(
            'assets/img/logobwd.png',
            height: 32,
          )
        ],
      );
    }

    Widget foto() {
      return Column(
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage('assets/img/foto.png'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/accountSettings'),
            child: Column(
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: user.doc(auth).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text('Loading...');
                    }
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    return Text(
                      "${snapshot.data!['full name']}",
                      style: heading3.copyWith(color: text1),
                    );
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Text('Type to edit',
                    style: paragraph4.copyWith(
                      color: text5,
                    ))
              ],
            ),
          ),
        ],
      );
    }

    Widget body() {
      return Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/accountSettings'),
              child: kontenBodyPofile(
                  icon: Icons.manage_accounts_rounded,
                  judul: 'Account settings',
                  desc: 'Personal data, account security'),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () => null,
              child: kontenBodyPofile(
                  icon: Icons.question_mark_rounded,
                  judul: 'General assistance',
                  desc: 'Terms and Conditions, Privacy & Rules'),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () => null,
              child: kontenBodyPofile(
                  icon: Icons.headset_mic_outlined,
                  judul: 'Help',
                  desc: 'Helpdesk, FAQ'),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () => null,
              child: kontenBodyPofile(
                  icon: Icons.error_outline_outlined,
                  judul: 'About',
                  desc: 'About Build With Daffa'),
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.language_outlined,
                      color: background2,
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Language',
                      style: paragraph1.copyWith(color: background2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (() => null),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text('EN',
                            style: paragraph4.copyWith(color: text2)),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: (() => null),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4)),
                        child: Text('ID',
                            style: paragraph4.copyWith(color: primary)),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Column(
        children: [
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/signIn');
            },
            child: Container(
              width: 120,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(32)),
              child: Center(
                  child: Text(
                'Log Out',
                style: paragraph1.copyWith(color: primary),
              )),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Version 1.1',
            style: paragraph4.copyWith(color: text5),
          )
        ],
      );
    }

    return SafeArea(
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(24),
          child: Column(
            children: [
              top(),
              SizedBox(
                height: 35,
              ),
              foto(),
              SizedBox(
                height: 24,
              ),
              body(),
              SizedBox(
                height: 14,
              ),
              footer()
            ],
          )),
    );
  }
}
