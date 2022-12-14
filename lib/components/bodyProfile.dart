import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class kontenBodyPofile extends StatelessWidget {
  const kontenBodyPofile(
      {super.key, required this.icon, required this.judul, required this.desc});
  final icon;
  final judul;
  final desc;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: background2,
              size: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: paragraph1.copyWith(color: background2),
                ),
                Text(
                  desc,
                  style: paragraph4.copyWith(color: text5),
                )
              ],
            )
          ],
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: background2,
          size: 24,
        )
      ],
    );
  }
}
// Icons.manage_accounts_outlined