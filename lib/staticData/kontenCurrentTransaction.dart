class ListKontenCurrentTransaction {
  String tanggal;
  String status;
  String gambar;
  String judul;
  List<String> tag;
  String totalHarga;
  ListKontenCurrentTransaction(
      {required this.gambar,
      required this.status,
      required this.judul,
      required this.tag,
      required this.tanggal,
      required this.totalHarga});
}

var ListKontenCT = [
  ListKontenCurrentTransaction(
      gambar: 'assets/img/contohCourse.png',
      status: 'On Process',
      judul: 'Contoh 10',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '20 November 2022',
      totalHarga: '300.000'),
  ListKontenCurrentTransaction(
      gambar: 'assets/img/contohCourse.png',
      status: 'On Process',
      judul: 'Contoh 2',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenCurrentTransaction(
      gambar: 'assets/img/contohCourse.png',
      status: 'On Process',
      judul: 'Contoh 3',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenCurrentTransaction(
      gambar: 'assets/img/contohCourse.png',
      status: 'On Process',
      judul: 'Contoh 4',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenCurrentTransaction(
      gambar: 'assets/img/contohCourse.png',
      status: 'On Process',
      judul: 'Contoh 5',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
];
