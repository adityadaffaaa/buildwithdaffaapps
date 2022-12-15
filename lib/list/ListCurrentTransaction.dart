import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/cardTransaction.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenCurrentTransaction.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';

class ListCurrentTransaction extends StatelessWidget {
  const ListCurrentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: ListView.builder(
          itemCount: ListKontenCT.length,
          itemBuilder: (context, index) {
            final listCT = ListKontenCT[index];
            return cardTransaction(
              gambar: listCT.gambar,
              judul: listCT.judul,
              tag: listCT.tag,
              status: listCT.status,
              totalHarga: listCT.totalHarga,
              tanggal: listCT.tanggal,
              bgStatus: secondary,
              textColor: primary,
            );
          },
        ));
  }
}
