import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/database_services.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';
import 'package:image_picker/image_picker.dart';

class accountSettings extends StatefulWidget {
  const accountSettings({super.key});

  @override
  State<accountSettings> createState() => _accountSettingsState();
}

class _accountSettingsState extends State<accountSettings> {
  var profilPicture;
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestoreInst = FirebaseFirestore.instance;
    CollectionReference user = firestoreInst.collection('user');
    final auth = FirebaseAuth.instance.currentUser!.uid;
    Widget top() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: background2,
            ),
          ),
          Text(
            'Account Settings',
            style: heading2.copyWith(color: primary),
          )
        ],
      );
    }

    Widget foto() {
      return Column(
        children: [
          Stack(children: [
            (profilPicture != null)
                ? Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: NetworkImage(profilPicture),
                            fit: BoxFit.cover)),
                  )
                : Icon(
                    Icons.account_circle_outlined,
                    size: 130,
                    color: primary,
                  ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () async {
                  XFile? file = await getImage();
                  profilPicture =
                      await DatabaseServices.uploadImage(profilPicture);

                  setState(() {});
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 24,
                    color: text2,
                  ),
                ),
              ),
            )
          ]),
          SizedBox(
            height: 14,
          ),
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
                '${snapshot.data!['full name']}',
                style: heading3.copyWith(color: text1),
              );
            },
          )
        ],
      );
    }

    Widget body() {
      return StreamBuilder<DocumentSnapshot>(
        stream: user.doc(auth).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          }
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: paragraph1.copyWith(color: background2),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    child: Expanded(
                      child: TextFormField(
                        controller: TextEditingController(
                            text: snapshot.data!['full name']),
                        decoration: InputDecoration.collapsed(
                            hintText: "${snapshot.data!['full name']}"),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: paragraph1.copyWith(color: background2),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    child: Expanded(
                        child: TextFormField(
                      controller: TextEditingController(
                          text: snapshot.data!['username']),
                      decoration: InputDecoration.collapsed(
                          hintText: "${snapshot.data!['username']}"),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: paragraph1.copyWith(color: background2),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    child: Expanded(
                        child: TextFormField(
                      controller:
                          TextEditingController(text: snapshot.data!['email']),
                      decoration: InputDecoration.collapsed(
                          hintText: "${snapshot.data!['email']}"),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Phone',
                    style: paragraph1.copyWith(color: background2),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    child: Expanded(
                        child: TextFormField(
                      controller: TextEditingController(
                          text: snapshot.data!['no phone'].toString()),
                      decoration: InputDecoration.collapsed(
                        hintText: "${snapshot.data!['no phone']}",
                      ),
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: paragraph1.copyWith(color: background2),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: primary, width: 2),
                        borderRadius: BorderRadius.circular(32)),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: TextEditingController(
                              text: snapshot.data!['password']),
                          obscureText: _isObscured,
                          decoration:
                              InputDecoration.collapsed(hintText: 'Password'),
                        )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                          child: Icon(
                            _isObscured
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: primary,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {},
                child: Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(32)),
                  child: Center(
                      child: Text(
                    'Save',
                    style: paragraph1.copyWith(color: text2),
                  )),
                ),
              ),
            ],
          );
        },
      );
    }

    Widget footer() {
      return Text(
        '© 2022 Build With Daffa',
        style: paragraph2.copyWith(color: primary),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                top(),
                SizedBox(
                  height: 35,
                ),
                foto(),
                SizedBox(height: 24),
                body(),
                SizedBox(
                  height: 52,
                ),
                footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<XFile?> getImage() async {
  return await ImagePicker().pickImage(source: ImageSource.gallery);
}
