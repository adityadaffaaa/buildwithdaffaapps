import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/cardKelasSaya.dart';
import 'package:flutter_buildwithdaffa/components/listKelasSaya.dart';
import 'package:flutter_buildwithdaffa/list/ListCardMyClass.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class kelasSaya extends StatelessWidget {
  const kelasSaya({super.key});

  @override
  Widget build(BuildContext context) {
    Widget top() {
      return Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Class',
                  style: heading2.copyWith(color: primary),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 260,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: text5,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(32)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        style: paragraph2.copyWith(color: text1),
                        decoration: InputDecoration.collapsed(
                            hintText: 'Find Your Class',
                            hintStyle: paragraph2.copyWith(color: text4)),
                      )),
                      Icon(
                        Icons.search,
                        color: text5,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: primary,
                    size: 32,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 14,
            ),
            ListKelasSaya()
          ],
        ),
      );
    }

    Widget body() {
      return ListCardMyClass();
    }

    return ListView(
      children: [top(), body()],
    );
  }
}
