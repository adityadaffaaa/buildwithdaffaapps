import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: text2,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification',
                  style: heading2.copyWith(color: primary),
                ),
                Image.asset(
                  'assets/img/logobwd.png',
                  height: 32,
                )
              ],
            ),
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: primary,
          tabs: <Widget>[
            Text('Transaction history',
                style: paragraph2.copyWith(color: primary)),
            Text(
              'Current transaction',
              style: paragraph2.copyWith(color: primary),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: TabBarView(
            controller: tabController,
            clipBehavior: Clip.antiAlias,
            children: [TransactionHistory(), CurrentTransaction()]),
      ),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Transaction History'),
    );
  }
}

class CurrentTransaction extends StatelessWidget {
  const CurrentTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Curret Transaction'),
    );
  }
}
