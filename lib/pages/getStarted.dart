import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/button.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class getStartedPage extends StatelessWidget {
  const getStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Container(
        child: Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logobwd.png',
                height: 70,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '“Mulai pengalaman bersama aplikasi build with daffa untuk membawa kamu agar bisa menjadi master of technology”',
                textAlign: TextAlign.center,
                style: paragraph2.copyWith(color: text5),
              )
            ],
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/signIn'),
                      child: CustomBtn(
                        color: text2,
                        text: "Sign In",
                        bgcolor: primary,
                        borderColor: primary,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/signUp'),
                      child: CustomBtn(
                        color: primary,
                        text: "Sign Up",
                        bgcolor: text2,
                        borderColor: primary,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                '© 2022 Build With Daffa',
                style: paragraph2.copyWith(color: primary),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Column(
            children: [body(), footer()],
          ),
        ),
      ),
    );
  }
}
