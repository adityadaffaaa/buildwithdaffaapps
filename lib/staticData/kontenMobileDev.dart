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
      judul: 'Full stack laravel  flutter : Mobile apps',
      tag: ['Dart', 'PHP'],
      rate: '4.8',
      bahasa: 'English',
      waktu: '1.5 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'React native dasar',
      tag: ['Kotlin'],
      rate: '4.5',
      bahasa: 'English',
      waktu: '2 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Flutter mobile dasar',
      tag: ['JavaScript'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '3 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Flutter mobile apps',
      tag: ['JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '2 Hours'),
  MobileDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Full stack android developer',
      tag: ['JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '2 Hours'),
];
