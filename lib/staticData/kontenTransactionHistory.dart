
class ListKontenTransactionHistory {
  String tanggal;
  String status;
  String gambar;
  String judul;
  List<String> tag;
  String totalHarga;
  ListKontenTransactionHistory(
      {required this.gambar,
      required this.status,
      required this.judul,
      required this.tag,
      required this.tanggal,
      required this.totalHarga});
}

var ListKontenTH = [
  ListKontenTransactionHistory(
      gambar: 'assets/img/contohCourse.png',
      status: 'Paid Off',
      judul: 'Contoh 1',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '20 November 2022',
      totalHarga: '300.000'),
  ListKontenTransactionHistory(
      gambar: 'assets/img/contohCourse.png',
      status: 'Paid off',
      judul: 'Contoh 2',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenTransactionHistory(
      gambar: 'assets/img/contohCourse.png',
      status: 'Paid off',
      judul: 'Contoh 3',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenTransactionHistory(
      gambar: 'assets/img/contohCourse.png',
      status: 'Paid off',
      judul: 'Contoh 4',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
  ListKontenTransactionHistory(
      gambar: 'assets/img/contohCourse.png',
      status: 'Paid off',
      judul: 'Contoh 5',
      tag: ['HTML', 'CSS', 'JavaScript'],
      tanggal: '03 Oktober 2022',
      totalHarga: '500.000'),
];
