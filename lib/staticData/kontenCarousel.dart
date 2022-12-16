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
      judul: 'Freelance UI UX Designer',
      deskripsi:
          'Memperdalam visual design dari segi layout, pewarnaan, typography, interaction, dan juga masih banyak bidang lainnya'),
  kontenCarousel(
      gambar: 'assets/img/ContohKategori.png',
      judul: 'Full Stack Javascript Developer',
      deskripsi:
          'Bekerja sama dengan tim desainer dalam mengimplementasikan hasil design projek ke bentuk template HTML menggunakan Framework yang popular'),
  kontenCarousel(
      gambar: 'assets/img/ContohKategori.png',
      judul: 'Full Stack Mobile Developer',
      deskripsi:
          'Menguasai bahasa pemrograman Dart dan Flutter SDK dalam membangun aplikasi iOS/Android')
];
