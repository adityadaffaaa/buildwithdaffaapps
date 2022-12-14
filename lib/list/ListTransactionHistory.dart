import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/cardTransactionHistory.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenTransactionHistory.dart';

class ListTransactionHistory extends StatelessWidget {
  const ListTransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: ListView.builder(
          itemCount: ListKontenTH.length,
          itemBuilder: (context, index) {
            final listTH = ListKontenTH[index];
            return cardTransactionHistory(
              gambar: listTH.gambar,
              judul: listTH.judul,
              tag: listTH.tag,
              status: listTH.status,
              totalHarga: listTH.totalHarga,
              tanggal: listTH.tanggal,
            );
          },
        ));
  }
}
