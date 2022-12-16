import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController noTelp = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    // TODO: implement dispose
    fullName.dispose();
    userName.dispose();
    emailController.dispose();
    noTelp.dispose();
    password.dispose();
    super.dispose();
  }

  Future SignUp() async {
    try {
      final messengerCT = ScaffoldMessenger.of(context);
      final navigatorCT = Navigator.of(context);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: password.text)
          .then((value) => FirebaseFirestore.instance
                  .collection('user')
                  .doc(value.user?.email)
                  .set({
                'email': value.user?.email,
                'full name': fullName.text,
                'username': userName.text,
                'no phone': int.tryParse(noTelp.text),
                'password': password.text
              }));
      messengerCT.showSnackBar(SnackBar(
        content: Text(
            'Selamat Anda berhasil registrasi ${FirebaseAuth.instance.currentUser!.email}'),
        duration: const Duration(seconds: 5),
      ));
      navigatorCT.pushReplacementNamed('/mainScreen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email sudah terpakai'),
          duration: Duration(seconds: 5),
        ));
      } else if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Password Anda lemah!'),
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
      return Container(
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
                        controller: fullName,
                        style: paragraph2.copyWith(color: primary),
                        decoration: InputDecoration.collapsed(
                            hintText: "Fullname",
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
                      child: Expanded(
                          child: TextField(
                        controller: userName,
                        style: paragraph2.copyWith(color: primary),
                        decoration: InputDecoration.collapsed(
                            hintText: "Username",
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
                      child: Expanded(
                          child: TextField(
                        controller: emailController,
                        style: paragraph2.copyWith(color: primary),
                        keyboardType: TextInputType.emailAddress,
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
                      child: Expanded(
                          child: TextField(
                        controller: noTelp,
                        style: paragraph2.copyWith(color: primary),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration.collapsed(
                            hintText: "No Phone",
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
                              child: TextField(
                            controller: password,
                            style: paragraph2.copyWith(color: primary),
                            obscureText: _isObscured,
                            decoration: InputDecoration.collapsed(
                                hintText: "Password",
                                hintStyle: paragraph2.copyWith(color: primary)),
                          )),
                          InkWell(
                            onTap: () => setState(() {
                              _isObscured = !_isObscured;
                            }),
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
                  onTap: () => SignUp(),
                  child: CustomBtn(
                    bgcolor: primary,
                    text: "Sign Up",
                    borderColor: primary,
                    color: text2,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget footer() {
      return InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/signIn');
        },
        child: RichText(
          text: TextSpan(
              text: 'Already have an account?',
              style: paragraph2.copyWith(color: primary),
              children: [
                TextSpan(
                    text: ' Sign In',
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              body(),
              SizedBox(
                height: 160,
              ),
              footer()
            ],
          ),
        ),
      )),
    );
  }
}
