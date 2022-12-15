import 'package:flutter/material.dart';
import 'package:flutter_buildwithdaffa/style/colors.dart';
import 'package:flutter_buildwithdaffa/style/textStyle.dart';

class cardTransaction extends StatelessWidget {
  const cardTransaction(
      {super.key,
      required this.gambar,
      required this.judul,
      required this.status,
      required this.tanggal,
      required this.tag,
      required this.totalHarga,
      required this.bgStatus,
      required this.textColor});
  final gambar;
  final status;
  final judul;
  final tanggal;
  final List<String> tag;
  final totalHarga;
  final bgStatus;
  final textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14),
      height: 184,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: text2,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.1),
                blurRadius: 24,
                offset: Offset(0, 4))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tanggal,
                style: paragraph2.copyWith(color: text5),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: bgStatus, borderRadius: BorderRadius.circular(32)),
                child: Text(
                  status,
                  style: paragraph2.copyWith(color: textColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 122,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(gambar), fit: BoxFit.cover)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 160,
                          child: Text(
                            judul,
                            style: paragraph1.copyWith(color: primary),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 160,
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
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Total Price',
                          style: paragraph2.copyWith(color: text5),
                        ),
                        Text(
                          'IDR ' + totalHarga,
                          style: paragraph2.copyWith(color: primary),
                        )
                      ],
                    )
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
