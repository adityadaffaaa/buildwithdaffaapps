class WebDevList {
  String gambar;
  String judul;
  String waktu;
  String bahasa;
  String rate;
  List<String> tag;

  WebDevList(
      {required this.gambar,
      required this.judul,
      required this.tag,
      required this.rate,
      required this.bahasa,
      required this.waktu});
}

var ListKontenWebDev = [
  WebDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Web developer tools',
      tag: ['HTML', 'CSS', 'JavaScript'],
      rate: '4.8',
      bahasa: 'English',
      waktu: '1.5 Hours'),
  WebDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Full stack web programing',
      tag: ['HTML', 'CSS', 'PHP'],
      rate: '4.5',
      bahasa: 'English',
      waktu: '2 Hours'),
  WebDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'HTML 5 Dasar',
      tag: ['HTML', 'CSS', 'JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '3 Hours'),
  WebDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Full stack dev with laravel',
      tag: ['HTML', 'CSS', 'JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '2 Hours'),
  WebDevList(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Web dev with data webflow',
      tag: ['HTML', 'CSS', 'JavaScript', 'PHP'],
      rate: '4.9',
      bahasa: 'English',
      waktu: '2 Hours'),
];
