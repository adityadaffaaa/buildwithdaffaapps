import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/staticData/kategoriCoding.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';

class btnListKategori extends StatelessWidget {
  btnListKategori({
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

class ListKategori extends StatefulWidget {
  const ListKategori({super.key});

  @override
  State<ListKategori> createState() => _ListKategoriState();
}

class _ListKategoriState extends State<ListKategori> {
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
            itemCount: kategori.length,
            itemBuilder: (context, index) {
              final LKategori = kategori[index];
              return InkWell(
                onTap: () {},
                child: btnListKategori(
                  bgColor: text2,
                  text: LKategori,
                  textColor: primary,
                ),
              );
            }));
  }
}
