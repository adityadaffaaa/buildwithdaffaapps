import 'package:flutter/widgets.dart';
import 'package:flutter_buildwithdaffa/components/cardKelasSaya.dart';
import 'package:flutter_buildwithdaffa/staticData/kontenMyClass.dart';

class ListCardMyClass extends StatelessWidget {
  const ListCardMyClass({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: ListMyClass.length,
        itemBuilder: (context, index) {
          final MyClass = ListMyClass[index];
          return CardKelasSaya(
            gambar: MyClass.gambar,
            judul: MyClass.judul,
            bahasa: MyClass.bahasa,
            waktu: MyClass.waktu,
            tag: MyClass.tag,
          );
        },
      ),
    );
  }
}
