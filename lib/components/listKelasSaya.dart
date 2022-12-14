import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/staticData/kategoriCoding.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';

class btnListKelasSaya extends StatelessWidget {
  btnListKelasSaya({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.text,
  });
  final bgColor;
  final text;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: primary, width: 2)),
      child: Text(
        text,
        style: paragraph3.copyWith(color: textColor),
      ),
    );
  }
}

class ListKelasSaya extends StatefulWidget {
  const ListKelasSaya({super.key});

  @override
  State<ListKelasSaya> createState() => _ListKelasSayaState();
}

class _ListKelasSayaState extends State<ListKelasSaya> {
  var currentIndex = 0;
  @override
  void klik() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 42,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: MyClass.length,
            itemBuilder: (context, index) {
              final MC = MyClass[index];
              return InkWell(
                onTap: () {},
                child: btnListKelasSaya(
                  bgColor: primary,
                  text: MC,
                  textColor: text2,
                ),
              );
            }));
  }
}

var MyClass = ['Not yet started', 'On going', 'Finished'];
