class kontenCarousel {
  String gambar;
  String judul;
  String deskripsi;

  kontenCarousel(
      {required this.gambar, required this.judul, required this.deskripsi});
}

var KontenCarouselList = [
  kontenCarousel(
      gambar: 'assets/img/ContohKategori.png',
      judul: 'Tes Bro',
      deskripsi: 'Crepes adalah jajanan sejuta umat'),
  kontenCarousel(
      gambar: 'assets/img/ContohKategori.png',
      judul: 'Apa Hayooooo',
      deskripsi: 'Beli lah nasi kotak agar kenyang'),
  kontenCarousel(
      gambar: 'assets/img/ContohKategori.png',
      judul: 'Halo geesss',
      deskripsi: 'Halo gais david disini dan ini adalah hape')
];