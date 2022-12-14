import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/courseCard.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenWebDev.dart';

class ListCardWeb extends StatelessWidget {
  const ListCardWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 290,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListKontenWebDev.length,
          itemBuilder: (context, index) {
            final WebList = ListKontenWebDev[index];
            return Row(
              children: [
                courseCard(
                  gambar: WebList.gambar,
                  judul: WebList.judul,
                  bahasa: WebList.bahasa,
                  rate: WebList.rate,
                  waktu: WebList.waktu,
                  tag: WebList.tag,
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
