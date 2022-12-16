import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/pages/accountSettings.dart';
import 'package:flutter_buildwithdaffa/pages/getStarted.dart';
import 'package:flutter_buildwithdaffa/pages/screen/homePage.dart';
import 'package:flutter_buildwithdaffa/pages/introduction.dart';
import 'package:flutter_buildwithdaffa/pages/mainScreen.dart';
import 'package:flutter_buildwithdaffa/pages/signIn.dart';
import 'package:flutter_buildwithdaffa/pages/signUp.dart';
import 'package:flutter_buildwithdaffa/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Bwd());
}

class Bwd extends StatelessWidget {
  const Bwd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Build With Daffa Apps",
      // initialRoute: '/',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/introduction': (context) => introduction(),
        '/getStarted': (context) => getStartedPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/mainScreen': (context) => mainScreen(),
        '/accountSettings': (context) => accountSettings()
      },
    );
  }
}
