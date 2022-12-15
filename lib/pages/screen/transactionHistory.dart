import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/components/cardTransaction.dart';
import 'package:flutter_buildwithdaffa/list/ListTransactionHistory.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    Widget searchBar() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: text5, width: 2),
            borderRadius: BorderRadius.circular(32)),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              decoration: InputDecoration.collapsed(
                  hintText: 'Find transaction history',
                  hintStyle: paragraph2.copyWith(color: text4)),
            )),
            Icon(
              Icons.search,
              color: text5,
            )
          ],
        ),
      );
    }

    Widget KontenTransactionHistory() {
      return ListTransactionHistory();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            searchBar(),
            SizedBox(
              height: 24,
            ),
            KontenTransactionHistory()
          ],
        ),
      ),
    );
  }
}
