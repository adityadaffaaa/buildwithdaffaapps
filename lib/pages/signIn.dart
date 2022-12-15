import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';
import '../components/button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Widget body() {
      return Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logobwd.png',
                height: 70,
              ),
              SizedBox(
                height: 52,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                            color: text3,
                            borderRadius: BorderRadius.circular(32)),
                        child: Expanded(
                            child: TextFormField(
                          style: paragraph2.copyWith(color: primary),
                          decoration: InputDecoration.collapsed(
                              hintText: "Email",
                              hintStyle: paragraph2.copyWith(color: primary)),
                        )),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        decoration: BoxDecoration(
                            color: text3,
                            borderRadius: BorderRadius.circular(32)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: TextFormField(
                              style: paragraph2.copyWith(color: primary),
                              obscureText: true,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Password",
                                  hintStyle:
                                      paragraph2.copyWith(color: primary)),
                            )),
                            InkWell(
                              onTap: () => null,
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: primary,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        final messengerCT = ScaffoldMessenger.of(context);
                        final navigatorCT = Navigator.of(context);
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                        messengerCT.showSnackBar(SnackBar(
                          content: Text(
                              'Selamat Datang ${FirebaseAuth.instance.currentUser!.email}'),
                          duration: const Duration(seconds: 5),
                        ));
                        navigatorCT.pushReplacementNamed('/mainScreen');
                      } on FirebaseAuthException catch (e) {
                      
                      }
                    },
                    child: CustomBtn(
                      bgcolor: primary,
                      text: "Sign In",
                      color: text2,
                      borderColor: primary,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget footer() {
      return RichText(
        text: TextSpan(
            text: 'Don’t have an account?',
            style: paragraph2.copyWith(color: primary),
            children: [
              TextSpan(
                  text: ' Sign Up',
                  style: paragraph1,
                  recognizer: TapGestureRecognizer()..onTap)
            ]),
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [body(), footer()],
        ),
      )),
    );
  }
}
