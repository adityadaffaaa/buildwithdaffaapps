import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenWebDev.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class courseCard extends StatelessWidget {
  courseCard(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.tag,
      required this.bahasa,
      required this.rate,
      required this.waktu});
  final gambar;
  final judul;
  List<String> tag;
  final rate;
  final waktu;
  final bahasa;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 280,
        width: 276,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xff000000).withOpacity(0.1),
              blurRadius: 24,
              offset: const Offset(0, 4))
        ], borderRadius: BorderRadius.circular(16), color: text2),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(16))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(image: AssetImage(gambar)),
                ),
              ),
            ),
            Expanded(
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(color: primary),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: text2,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(16))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  judul,
                                  overflow: TextOverflow.clip,
                                  style: paragraph1.copyWith(color: primary),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: tag.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      tag[index] + ', ',
                                      style: paragraph2.copyWith(color: text5),
                                      overflow: TextOverflow.clip,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.bookmark_border,
                              size: 28,
                              color: primary,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: secondary,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                rate,
                                style: paragraph4.copyWith(color: text4),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
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
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
