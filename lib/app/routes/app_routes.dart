part of 'app_pages.dart';

/// All route names
abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const MATERI = _Paths.MATERI;
  static const ENGLISH_SUBMATERI = _Paths.ENGLISH_SUBMATERI;
  static const ENGLISH_ALPHABET = _Paths.ENGLISH_ALPHABET;
  static const PROFIL = _Paths.PROFIL;
  static const LOGOUT = _Paths.LOGOUT;
  static const LOGOUT_CONFIRM = _Paths.LOGOUT_CONFIRM;
  static const UBAH_KATA_SANDI = _Paths.UBAH_KATA_SANDI;
  static const VEGETABLES = _Paths.VEGETABLES;
  static const FLAGS = _Paths.FLAGS;
  static const ANIMALS = _Paths.ANIMALS;
  static const FRUITS = _Paths.FRUITS;
  static const CLOTHES = _Paths.CLOTHES;
  static const COLORS = _Paths.COLORS;
  static const SHAPES = _Paths.SHAPES;
  static const MATH_SUBMATERI = _Paths.MATH_SUBMATERI;
  static const ADDITION = _Paths.ADDITION;
  static const NUMBERS = _Paths.NUMBERS;
  static const BILANGAN_BULAT = _Paths.BILANGAN_BULAT;
  static const GANJIL_GENAP = _Paths.GANJIL_GENAP;
  static const PECAHAN = _Paths.PECAHAN;
  static const DESIMAL = _Paths.DESIMAL;
  static const ANGKA_ROMAWI = _Paths.ANGKA_ROMAWI;
  static const SUBTRACTION = _Paths.SUBTRACTION;
  static const MULTIPLICATION = _Paths.MULTIPLICATION;
  static const DIVISION = _Paths.DIVISION;
  static const SHAPE2 = _Paths.SHAPE2;
  static const PATTERN = _Paths.PATTERN;
  static const MEASUREMENT = _Paths.MEASUREMENT;
  static const IPA_SUBMATERI = _Paths.IPA_SUBMATERI;
  static const IPA_BAGIAN_TUBUH = _Paths.IPA_BAGIAN_TUBUH;
  static const IPA_INDERA_MANUSIA = _Paths.IPA_INDERA_MANUSIA;
  static const IPA_TUMBUHAN_HEWAN = _Paths.IPA_TUMBUHAN_HEWAN;
  static const IPA_BENDA_SIFAT = _Paths.IPA_BENDA_SIFAT;
  static const IPA_TATA_SURYA = _Paths.IPA_TATA_SURYA;
  static const IPA_TUMBUHAN_CONTOH = _Paths.IPA_TUMBUHAN_CONTOH;
  static const IPA_HEWAN_CONTOH = _Paths.IPA_HEWAN_CONTOH;
  static const IPA_BENDA_PADAT = _Paths.IPA_BENDA_PADAT;
  static const IPA_BENDA_CAIR = _Paths.IPA_BENDA_CAIR;
  static const IPA_BENDA_GAS = _Paths.IPA_BENDA_GAS;
  static const IPA_SIFAT_BENDA = _Paths.IPA_SIFAT_BENDA;
  static const SUB_MATERI_IPS = _Paths.SUB_MATERI_IPS;
  static const LINGKUNGAN_SEKITAR = _Paths.LINGKUNGAN_SEKITAR;
  static const PETA_ARAH_MATA_ANGIN = _Paths.PETA_ARAH_MATA_ANGIN;
  static const KEBUDAYAAN_TRADISI = _Paths.KEBUDAYAAN_TRADISI;
  static const PEKERJAAN_SEKITAR = _Paths.PEKERJAAN_SEKITAR;
  static const TANGGUNG_JAWAB_SEKOLAH = _Paths.TANGGUNG_JAWAB_SEKOLAH;
  static const SUBMATERI_SENI = _Paths.SUBMATERI_SENI;
  static const WARNA = _Paths.WARNA;
  static const BENTUK = _Paths.BENTUK;
  static const MELUKIS = _Paths.MELUKIS;
  static const KOLASE = _Paths.KOLASE;
  static const KRIYA = _Paths.KRIYA;
  static const EKSPRESI_SENI = _Paths.EKSPRESI_SENI;
  static const SUBMATERI_INDONESIA = _Paths.SUBMATERI_INDONESIA;
  static const MEMBACA_CERITA = _Paths.MEMBACA_CERITA;
  static const MENULIS_KALIMAT = _Paths.MENULIS_KALIMAT;
  static const TEKS_NARATIF = _Paths.TEKS_NARATIF;
  static const TEKS_DESKRIPTIF = _Paths.TEKS_DESKRIPTIF;
  static const PUISI_PANTUN = _Paths.PUISI_PANTUN;
  static const BERBICARA_DEPAN_UMUM = _Paths.BERBICARA_DEPAN_UMUM;
  static const KUIS = _Paths.KUIS;
  static const KUIS_BAHASA_INDONESIA = _Paths.KUIS_BAHASA_INDONESIA;
  static const KUIS_MATEMATIKA = _Paths.KUIS_MATEMATIKA;
  static const KUIS_IPA = _Paths.KUIS_IPA;
  static const KUIS_IPS = _Paths.KUIS_IPS;
  static const KUIS_PKN = _Paths.KUIS_PKN;
  static const KUIS_SENI = _Paths.KUIS_SENI;
  static const KUIS_BAHASA_INGGRIS = _Paths.KUIS_BAHASA_INGGRIS;
  static const TUGAS = _Paths.TUGAS;
  static const TUGAS_DETAIL = _Paths.TUGAS_DETAIL;
  static const GAME_HUB = _Paths.GAME_HUB;
  static const GAME_MONOPOLI = _Paths.GAME_MONOPOLI;
  static const GAME_MATEMATIKA = _Paths.GAME_MATEMATIKA;
  static const GAME_INGGRIS = _Paths.GAME_INGGRIS;
  static const SETTING = _Paths.SETTING;
  static const PAKAIAN_ADAT = _Paths.PAKAIAN_ADAT;
  static const RUMAH_ADAT = _Paths.RUMAH_ADAT;
  static const ALAT_MUSIK_ADAT = _Paths.ALAT_MUSIK_ADAT;
  static const UPACARA_ADAT = _Paths.UPACARA_ADAT;
  static const TARI_TRADISIONAL = _Paths.TARI_TRADISIONAL;
  static const FIND_LETTER_GAME = _Paths.FIND_LETTER_GAME;
  static const FLAGS_GAME = _Paths.FLAGS_GAME;
  static const MATCH_WORD_PICTURE = _Paths.MATCH_WORD_PICTURE;
  static const UBAH_USERNAME = _Paths.UBAH_USERNAME;
  static const TEBAK_PROVINSI_GAME = _Paths.TEBAK_PROVINSI_GAME;
  static const TEBAK_TEMPAT = _Paths.TEBAK_TEMPAT;
  static const ENGLISH_MATCHING_GAME = _Paths.ENGLISH_MATCHING_GAME;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const DASHBOARD = '/dashboard';
  static const MATERI = '/materi';
  static const ENGLISH_SUBMATERI = '/english-submateri';
  static const ENGLISH_ALPHABET = '/english-alphabet';
  static const PROFIL = '/profil';
  static const LOGOUT = '/logout';
  static const LOGOUT_CONFIRM = '/logout-confirm';
  static const UBAH_KATA_SANDI = '/ubah-kata-sandi';
  static const VEGETABLES = '/vegetables';
  static const FLAGS = '/flags';
  static const ANIMALS = '/animals';
  static const FRUITS = '/fruits';
  static const CLOTHES = '/clothes';
  static const COLORS = '/colors';
  static const SHAPES = '/shapes';
  static const MATH_SUBMATERI = '/math-submateri';
  static const ADDITION = '/addition';
  static const NUMBERS = '/numbers';
  static const BILANGAN_BULAT = '/bilangan-bulat';
  static const GANJIL_GENAP = '/ganjil-genap';
  static const PECAHAN = '/pecahan';
  static const DESIMAL = '/desimal';
  static const ANGKA_ROMAWI = '/angka-romawi';
  static const SUBTRACTION = '/subtraction';
  static const MULTIPLICATION = '/multiplication';
  static const DIVISION = '/division';
  static const SHAPE2 = '/shape2';
  static const PATTERN = '/pattern';
  static const MEASUREMENT = '/measurement';
  static const IPA_SUBMATERI = '/ipa-submateri';
  static const IPA_BAGIAN_TUBUH = '/ipa-bagian-tubuh';
  static const IPA_INDERA_MANUSIA = '/ipa-indera-manusia';
  static const IPA_TUMBUHAN_HEWAN = '/ipa-tumbuhan-hewan';
  static const IPA_BENDA_SIFAT = '/ipa-benda-sifat';
  static const IPA_TATA_SURYA = '/ipa-tata-surya';
  static const IPA_TUMBUHAN_CONTOH = '/ipa-tumbuhan-contoh';
  static const IPA_HEWAN_CONTOH = '/ipa-hewan-contoh';
  static const IPA_BENDA_PADAT = '/ipa-benda-padat';
  static const IPA_BENDA_CAIR = '/ipa-benda-cair';
  static const IPA_BENDA_GAS = '/ipa-benda-gas';
  static const IPA_SIFAT_BENDA = '/ipa-sifat-benda';
  static const SUB_MATERI_IPS = '/sub-materi-ips';
  static const LINGKUNGAN_SEKITAR = '/lingkungan-sekitar';
  static const PETA_ARAH_MATA_ANGIN = '/peta-arah-mata-angin';
  static const KEBUDAYAAN_TRADISI = '/kebudayaan-tradisi';
  static const PEKERJAAN_SEKITAR = '/pekerjaan-sekitar';
  static const TANGGUNG_JAWAB_SEKOLAH = '/tanggung-jawab-sekolah';
  static const SUBMATERI_SENI = '/submateri-seni';
  static const WARNA = '/warna';
  static const BENTUK = '/bentuk';
  static const MELUKIS = '/melukis';
  static const KOLASE = '/kolase';
  static const KRIYA = '/kriya';
  static const EKSPRESI_SENI = '/ekspresi-seni';
  static const SUBMATERI_INDONESIA = '/submateri-indonesia';
  static const MEMBACA_CERITA = '/membaca-cerita';
  static const MENULIS_KALIMAT = '/menulis-kalimat';
  static const TEKS_NARATIF = '/teks-naratif';
  static const TEKS_DESKRIPTIF = '/teks-deskriptif';
  static const PUISI_PANTUN = '/puisi-pantun';
  static const BERBICARA_DEPAN_UMUM = '/berbicara-depan-umum';
  static const KUIS = '/kuis';
  static const KUIS_BAHASA_INDONESIA = '/kuis-bahasa-indonesia';
  static const KUIS_MATEMATIKA = '/kuis-matematika';
  static const KUIS_IPA = '/kuis-ipa';
  static const KUIS_IPS = '/kuis-ips';
  static const KUIS_PKN = '/kuis-pkn';
  static const KUIS_SENI = '/kuis-seni';
  static const KUIS_BAHASA_INGGRIS = '/kuis-bahasa-inggris';
  static const TUGAS = '/tugas';
  static const TUGAS_DETAIL = '/tugas-detail';
  static const GAME_HUB = '/game-hub';
  static const GAME_MONOPOLI = '/game-monopoli';
  static const GAME_MATEMATIKA = '/game-matematika';
  static const GAME_INGGRIS = '/game-inggris';
  static const SETTING = '/setting';
  static const PAKAIAN_ADAT = '/pakaian-adat';
  static const RUMAH_ADAT = '/rumah-adat';
  static const ALAT_MUSIK_ADAT = '/alat-musik-adat';
  static const UPACARA_ADAT = '/upacara-adat';
  static const TARI_TRADISIONAL = '/tari-tradisional';
  static const FIND_LETTER_GAME = '/find-letter-game';
  static const FLAGS_GAME = '/flags-game';
  static const MATCH_WORD_PICTURE = '/match-word-picture';
  static const UBAH_USERNAME = '/ubah-username';
  static const TEBAK_PROVINSI_GAME = '/tebak-provinsi-game';
  static const TEBAK_TEMPAT = '/tebak-tempat';
  static const ENGLISH_MATCHING_GAME = '/english-matching-game';
}
