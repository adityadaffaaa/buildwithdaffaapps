import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/courseCard.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenMobileDev.dart';

class ListCardMobile extends StatelessWidget {
  const ListCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 290,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListKontenMobileDev.length,
          itemBuilder: (context, index) {
            final MobileList = ListKontenMobileDev[index];
            return Row(
              children: [
                courseCard(
                  gambar: MobileList.gambar,
                  judul: MobileList.judul,
                  bahasa: MobileList.bahasa,
                  rate: MobileList.rate,
                  waktu: MobileList.waktu,
                  tag: MobileList.tag,
                ),
                SizedBox(
                  width: 24,
                )
              ],
            );
          },
        ));
  }
}
