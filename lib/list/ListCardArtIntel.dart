import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/courseCard.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenAI.dart';

class ListCardArtIntel extends StatelessWidget {
  const ListCardArtIntel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 290,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ListKontenAi.length,
          itemBuilder: (context, index) {
            final ArtIntel = ListKontenAi[index];
            return Row(
              children: [
                courseCard(
                  gambar: ArtIntel.gambar,
                  judul: ArtIntel.judul,
                  bahasa: ArtIntel.bahasa,
                  rate: ArtIntel.rate,
                  waktu: ArtIntel.waktu,
                  tag: ArtIntel.tag,
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
