import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class accountSettings extends StatelessWidget {
  const accountSettings({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage('assets/img/foto.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: (() => null),
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
          Text(
            'Aditya Kusmara',
            style: heading3.copyWith(color: text1),
          ),
        ],
      );
    }

    Widget body() {
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
                  decoration: InputDecoration.collapsed(hintText: 'Name'),
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
                  decoration: InputDecoration.collapsed(hintText: 'Username'),
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
                  decoration: InputDecoration.collapsed(hintText: 'Email'),
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
                  decoration: InputDecoration.collapsed(hintText: 'No Phone',),
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
                      obscureText: true,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Password'),
                    )),
                    InkWell(
                      onTap: (() => null),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
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
            onTap: (() => null),
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
