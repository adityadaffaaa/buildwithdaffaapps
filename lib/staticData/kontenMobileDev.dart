class MobileDevList {
  String gambar;
  String judul;
  String waktu;
  String bahasa;
  String rate;
  List<String> tag;

  MobileDevList(
      {required this.gambar,
      required this.judul,
      required this.tag,
      required this.rate,
      required this.bahasa,
      required this.waktu});
}

var ListKontenMobileDev = [
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh 4',
      tag: ['Dart', 'PHP'],
      rate: '4.8',
      bahasa: 'English',
      waktu: '1.5 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh 3',
      tag: ['Kotlin'],
      rate: '4.5',
      bahasa: 'English',
      waktu: '2 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh 2',
      tag: ['JavaScript'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '3 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh ',
      tag: ['JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '2 Hours'),
];
