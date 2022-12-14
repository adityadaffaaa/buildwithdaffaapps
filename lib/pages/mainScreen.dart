import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/pages/screen/homePage.dart';
import 'package:flutter_buildwithdaffa/pages/screen/kelasSaya.dart';
import 'package:flutter_buildwithdaffa/pages/screen/notification.dart';
import 'package:flutter_buildwithdaffa/pages/screen/profil.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final pages = [HomePage(), kelasSaya(), notification(), profilPage()];

  int selectedIndex = 0;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool keyboardOpen = false;

  // @override
  // void initState() {
  //   super.initState();
  //   KeyboardVisibilityController.addNewListener(
  //     onChange: (bool visible) {
  //       setState(() => keyboardOpen = visible);
  //     },
  //   );
  // }

  Widget searchBtn() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: primary,
      child: Icon(
        Icons.search,
        size: 28,
      ),
    );
  }

  Widget customNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: primary,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(top: 12),
                    child: selectedIndex == 0
                        ? Icon(
                            Icons.home,
                            color: secondary,
                            size: 28,
                          )
                        : Icon(
                            Icons.home_outlined,
                            color: text2,
                            size: 28,
                          )),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 12),
                  child: selectedIndex == 1
                      ? Icon(
                          Icons.bookmark,
                          color: secondary,
                          size: 28,
                        )
                      : Icon(
                          Icons.bookmark_border,
                          color: text2,
                          size: 28,
                        ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 12),
                  child: selectedIndex == 2
                      ? Icon(
                          Icons.notifications,
                          color: secondary,
                          size: 28,
                        )
                      : Icon(
                          Icons.notifications_none_outlined,
                          color: text2,
                          size: 28,
                        ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                    margin: EdgeInsets.only(top: 12),
                    child: selectedIndex == 3
                        ? Icon(
                            Icons.account_circle,
                            color: secondary,
                            size: 28,
                          )
                        : Icon(
                            Icons.account_circle_outlined,
                            color: text2,
                            size: 28,
                          )),
                label: ''),
          ],
          currentIndex: selectedIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: searchBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customNav(),
      body: pages.elementAt(selectedIndex),
    );
  }
}
