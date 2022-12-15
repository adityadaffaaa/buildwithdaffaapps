import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';
import '../components/button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });
  // final Function() onClick;
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    password.dispose();
    super.dispose();
  }

  Future SignIn() async {
    try {
      final messengerCT = ScaffoldMessenger.of(context);
      final navigatorCT = Navigator.of(context);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: password.text);
      messengerCT.showSnackBar(SnackBar(
        content:
            Text('Selamat Datang ${FirebaseAuth.instance.currentUser!.email}'),
        duration: const Duration(seconds: 5),
      ));
      navigatorCT.pushReplacementNamed('/mainScreen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User tidak ditemukan'),
          duration: Duration(seconds: 5),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password salah'),
          duration: Duration(seconds: 5),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.code),
          duration: Duration(seconds: 5),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          controller: emailController,
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
                              controller: password,
                              style: paragraph2.copyWith(color: primary),
                              obscureText: _isObscured,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Password",
                                  hintStyle:
                                      paragraph2.copyWith(color: primary)),
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
                    onTap: SignIn,
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
      return InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, '/signUp'),
        child: RichText(
          text: TextSpan(
              text: 'Don’t have an account?',
              style: paragraph2.copyWith(color: primary),
              children: [
                TextSpan(
                    text: ' Sign Up',
                    style: paragraph1,
                    recognizer: TapGestureRecognizer()..onTap)
              ]),
        ),
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
