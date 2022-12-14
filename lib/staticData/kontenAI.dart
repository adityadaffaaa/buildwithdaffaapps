class ArtIntel {
  String gambar;
  String judul;
  String waktu;
  String bahasa;
  String rate;
  List<String> tag;

  ArtIntel(
      {required this.gambar,
      required this.judul,
      required this.tag,
      required this.rate,
      required this.bahasa,
      required this.waktu});
}

var ListKontenAi = [
  ArtIntel(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh 5',
      tag: ['Python', 'C++', 'C#'],
      rate: '4.8',
      bahasa: 'English',
      waktu: '5 Hours'),
  ArtIntel(
      gambar: 'assets/img/contohCourse.png',
      judul: 'Contoh 2',
      tag: ['Python', 'Arduino'],
      rate: '4.5',
      bahasa: 'English',
      waktu: '3 Hours'),
];
