import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class CardKelasSaya extends StatelessWidget {
  CardKelasSaya(
      {super.key,
      required this.judul,
      required this.bahasa,
      required this.gambar,
      required this.tag,
      required this.waktu});
  final judul;
  final gambar;
  List<String> tag;
  final waktu;
  final bahasa;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 14),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: const Color(0xff000000).withOpacity(0.1),
              blurRadius: 24,
              offset: const Offset(0, 4))
        ],
        borderRadius: BorderRadius.circular(16),
        color: text2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              width: 150,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    image: AssetImage(gambar), fit: BoxFit.cover),
              ))),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 154,
                      child: Text(
                        judul,
                        style: paragraph1.copyWith(color: primary),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tag.length,
                        itemBuilder: (context, index) {
                          return Text(
                            tag[index] + ', ',
                            style: paragraph2.copyWith(color: text5),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: text4,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          waktu,
                          style: paragraph4.copyWith(color: text4),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language_outlined,
                          color: text4,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          bahasa,
                          style: paragraph4.copyWith(color: text4),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



