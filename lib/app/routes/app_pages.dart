import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/Kuis/bindings/kuis_binding.dart';
import '../modules/Kuis/views/kuis_view.dart';
import '../modules/SubmateriSeni/bindings/submateri_seni_binding.dart';
import '../modules/SubmateriSeni/views/submateri_seni_view.dart';
import '../modules/addition/bindings/addition_binding.dart';
import '../modules/addition/views/addition_view.dart';
import '../modules/animals/bindings/animals_binding.dart';
import '../modules/animals/views/animals_view.dart';
import '../modules/bentuk/bindings/bentuk_binding.dart';
import '../modules/bentuk/views/bentuk_view.dart';
import '../modules/berbicara_depan_umum/bindings/berbicara_depan_umum_binding.dart';
import '../modules/berbicara_depan_umum/views/berbicara_depan_umum_view.dart';
import '../modules/clothes/bindings/clothes_binding.dart';
import '../modules/clothes/views/clothes_view.dart';
import '../modules/colors/bindings/colors_binding.dart';
import '../modules/colors/views/colors_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/division/bindings/division_binding.dart';
import '../modules/division/views/division_view.dart';
import '../modules/ekspresi_seni/bindings/ekspresi_seni_binding.dart';
import '../modules/ekspresi_seni/views/ekspresi_seni_view.dart';
import '../modules/english-alphabet/bindings/english_alphabet_binding.dart';
import '../modules/english-alphabet/views/english_alphabet_view.dart';
import '../modules/english-submateri/bindings/english_submateri_binding.dart';
import '../modules/english-submateri/views/english_submateri_view.dart';
import '../modules/flags/bindings/flags_binding.dart';
import '../modules/flags/views/flags_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/fruits/bindings/fruits_binding.dart';
import '../modules/fruits/views/fruits_view.dart';
import '../modules/ipa-benda-cair/bindings/ipa_benda_cair_binding.dart';
import '../modules/ipa-benda-cair/views/ipa_benda_cair_view.dart';
import '../modules/ipa-benda-gas/bindings/ipa_benda_gas_binding.dart';
import '../modules/ipa-benda-gas/views/ipa_benda_gas_view.dart';
import '../modules/ipa-benda-padat/bindings/ipa_benda_padat_binding.dart';
import '../modules/ipa-benda-padat/views/ipa_benda_padat_view.dart';
import '../modules/ipa-hewan-contoh/bindings/ipa_hewan_contoh_binding.dart';
import '../modules/ipa-hewan-contoh/views/ipa_hewan_contoh_view.dart';
import '../modules/ipa-sifat-benda/bindings/ipa_sifat_benda_binding.dart';
import '../modules/ipa-sifat-benda/views/ipa_sifat_benda_view.dart';
import '../modules/ipa-submateri/bindings/ipa_submateri_binding.dart';
import '../modules/ipa-submateri/views/ipa_submateri_view.dart';
import '../modules/ipa-tumbuhan-contoh/bindings/ipa_tumbuhan_contoh_binding.dart';
import '../modules/ipa-tumbuhan-contoh/views/ipa_tumbuhan_contoh_view.dart';
import '../modules/ipa_bagian_tubuh/bindings/ipa_bagian_tubuh_binding.dart';
import '../modules/ipa_bagian_tubuh/views/ipa_bagian_tubuh_view.dart';
import '../modules/ipa_benda_sifat/bindings/ipa_benda_sifat_binding.dart';
import '../modules/ipa_benda_sifat/views/ipa_benda_sifat_view.dart';
import '../modules/ipa_indera_manusia/bindings/ipa_indera_manusia_binding.dart';
import '../modules/ipa_indera_manusia/views/ipa_indera_manusia_view.dart';
import '../modules/ipa_tata_surya/bindings/ipa_tata_surya_binding.dart';
import '../modules/ipa_tata_surya/views/ipa_tata_surya_view.dart';
import '../modules/ipa_tumbuhan_hewan/bindings/ipa_tumbuhan_hewan_binding.dart';
import '../modules/ipa_tumbuhan_hewan/views/ipa_tumbuhan_hewan_view.dart';
import '../modules/kebudayaan_tradisi/bindings/kebudayaan_tradisi_binding.dart';
import '../modules/kebudayaan_tradisi/views/kebudayaan_tradisi_view.dart';
import '../modules/kolase/bindings/kolase_binding.dart';
import '../modules/kolase/views/kolase_view.dart';
import '../modules/kriya/bindings/kriya_binding.dart';
import '../modules/kriya/views/kriya_view.dart';
import '../modules/kuis_bahasa_indonesia/bindings/kuis_bahasa_indonesia_binding.dart';
import '../modules/kuis_bahasa_indonesia/views/kuis_bahasa_indonesia_view.dart';
import '../modules/kuis_ipa/bindings/kuis_ipa_binding.dart';
import '../modules/kuis_ipa/views/kuis_ipa_view.dart';
import '../modules/kuis_ips/bindings/kuis_ips_binding.dart';
import '../modules/kuis_ips/views/kuis_ips_view.dart';
import '../modules/kuis_matematika/bindings/kuis_matematika_binding.dart';
import '../modules/kuis_matematika/views/kuis_matematika_view.dart';
import '../modules/lingkungan_sekitar/bindings/lingkungan_sekitar_binding.dart';
import '../modules/lingkungan_sekitar/views/lingkungan_sekitar_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout_confirm/bindings/logout_confirm_binding.dart';
import '../modules/logout_confirm/views/logout_confirm_view.dart';
import '../modules/materi/views/materi_view.dart';
import '../modules/math-submateri/bindings/math_submateri_binding.dart';
import '../modules/math-submateri/views/math_submateri_view.dart';
import '../modules/measurement/bindings/measurement_binding.dart';
import '../modules/measurement/views/measurement_view.dart';
import '../modules/melukis/bindings/melukis_binding.dart';
import '../modules/melukis/views/melukis_view.dart';
import '../modules/membaca_cerita/bindings/membaca_cerita_binding.dart';
import '../modules/membaca_cerita/views/membaca_cerita_view.dart';
import '../modules/menulis_kalimat/bindings/menulis_kalimat_binding.dart';
import '../modules/menulis_kalimat/views/menulis_kalimat_view.dart';
import '../modules/multiplication/bindings/multiplication_binding.dart';
import '../modules/multiplication/views/multiplication_view.dart';
import '../modules/numbers/bindings/numbers_binding.dart';
import '../modules/numbers/views/numbers_view.dart';
import '../modules/patterns/bindings/pattern_binding.dart';
import '../modules/patterns/views/pattern_view.dart';
import '../modules/pekerjaan_sekitar/bindings/pekerjaan_sekitar_binding.dart';
import '../modules/pekerjaan_sekitar/views/pekerjaan_sekitar_view.dart';
import '../modules/peta_arah_mata_angin/bindings/peta_arah_mata_angin_binding.dart';
import '../modules/peta_arah_mata_angin/views/peta_arah_mata_angin_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/puisi_pantun/bindings/puisi_pantun_binding.dart';
import '../modules/puisi_pantun/views/puisi_pantun_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/shape2/bindings/shape2_binding.dart';
import '../modules/shape2/views/shape2_view.dart';
import '../modules/shapes/bindings/shapes_binding.dart';
import '../modules/shapes/views/shapes_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/sub_materi_ips/bindings/sub_materi_ips_binding.dart';
import '../modules/sub_materi_ips/views/sub_materi_ips_view.dart';
import '../modules/submateri-indonesia/bindings/submateri_indonesia_binding.dart';
import '../modules/submateri-indonesia/views/submateri_indonesia_view.dart';
import '../modules/subtraction/bindings/subtraction_binding.dart';
import '../modules/subtraction/views/subtraction_view.dart';
import '../modules/tanggung_jawab_sekolah/bindings/tanggung_jawab_sekolah_binding.dart';
import '../modules/tanggung_jawab_sekolah/views/tanggung_jawab_sekolah_view.dart';
import '../modules/teks_deskriptif/bindings/teks_deskriptif_binding.dart';
import '../modules/teks_deskriptif/views/teks_deskriptif_view.dart';
import '../modules/teks_naratif/bindings/teks_naratif_binding.dart';
import '../modules/teks_naratif/views/teks_naratif_view.dart';
import '../modules/ubah_kata_sandi/bindings/ubah_kata_sandi_binding.dart';
import '../modules/ubah_kata_sandi/views/ubah_kata_sandi_view.dart';
import '../modules/vegetables/bindings/vegetables_binding.dart';
import '../modules/vegetables/views/vegetables_view.dart';
import '../modules/warna/bindings/warna_binding.dart';
import '../modules/warna/views/warna_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(),
    ),
    GetPage(
      name: _Paths.ENGLISH_SUBMATERI,
      page: () => const EnglishSubmateriView(),
      binding: EnglishSubmateriBinding(),
    ),
    GetPage(
      name: _Paths.ENGLISH_ALPHABET,
      page: () => const EnglishAlphabetSwiperView(),
      binding: EnglishAlphabetBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT_CONFIRM,
      page: () => const LogoutConfirmView(),
      binding: LogoutConfirmBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_KATA_SANDI,
      page: () => UbahKataSandiView(),
      binding: UbahKataSandiBinding(),
    ),
    GetPage(
      name: _Paths.VEGETABLES,
      page: () => const VegetablesView(),
      binding: VegetablesBinding(),
    ),
    GetPage(
      name: _Paths.FLAGS,
      page: () => FlagsView(),
      binding: FlagsBinding(),
    ),
    GetPage(
      name: _Paths.ANIMALS,
      page: () => AnimalsView(),
      binding: AnimalsBinding(),
    ),
    GetPage(
      name: _Paths.FRUITS,
      page: () => FruitsView(),
      binding: FruitsBinding(),
    ),
    GetPage(
      name: _Paths.CLOTHES,
      page: () => ClothesView(),
      binding: ClothesBinding(),
    ),
    GetPage(
      name: _Paths.COLORS,
      page: () => ColorsView(),
      binding: ColorsBinding(),
    ),
    GetPage(
      name: _Paths.SHAPES,
      page: () => ShapesView(),
      binding: ShapesBinding(),
    ),
    GetPage(
      name: _Paths.MATH_SUBMATERI,
      page: () => MathSubmateriView(),
      binding: MathSubmateriBinding(),
    ),
    GetPage(
      name: _Paths.ADDITION,
      page: () => AdditionView(),
      binding: AdditionBinding(),
    ),
    GetPage(
      name: _Paths.NUMBERS,
      page: () => NumbersView(),
      binding: NumbersBinding(),
    ),
    GetPage(
      name: _Paths.SUBTRACTION,
      page: () => const SubtractionView(),
      binding: SubtractionBinding(),
    ),
    GetPage(
      name: _Paths.MULTIPLICATION,
      page: () => MultiplicationView(),
      binding: MultiplicationBinding(),
    ),
    GetPage(
      name: _Paths.DIVISION,
      page: () => const DivisionView(),
      binding: DivisionBinding(),
    ),
    GetPage(
      name: _Paths.SHAPE2,
      page: () => Shape2View(),
      binding: Shape2Binding(),
    ),
    GetPage(
      name: _Paths.PATTERN,
      page: () => PatternsView(),
      binding: PatternBinding(),
    ),
    GetPage(
      name: _Paths.MEASUREMENT,
      page: () => MeasurementView(),
      binding: MeasurementBinding(),
    ),
    GetPage(
      name: _Paths.IPA_SUBMATERI,
      page: () => IpaSubmateriView(),
      binding: IpaSubmateriBinding(),
    ),
    GetPage(
      name: _Paths.IPA_BAGIAN_TUBUH,
      page: () => IpaBagianTubuhView(),
      binding: IpaBagianTubuhBinding(),
    ),
    GetPage(
      name: _Paths.IPA_INDERA_MANUSIA,
      page: () => IpaInderaManusiaView(),
      binding: IpaInderaManusiaBinding(),
    ),
    GetPage(
      name: _Paths.IPA_TUMBUHAN_HEWAN,
      page: () => IpaTumbuhanHewanView(),
      binding: IpaTumbuhanHewanBinding(),
    ),
    GetPage(
      name: _Paths.IPA_BENDA_SIFAT,
      page: () => const IpaBendaSifatView(),
      binding: IpaBendaSifatBinding(),
    ),
    GetPage(
      name: _Paths.IPA_TATA_SURYA,
      page: () => IpaTataSuryaView(),
      binding: IpaTataSuryaBinding(),
    ),
    GetPage(
      name: _Paths.IPA_TUMBUHAN_CONTOH,
      page: () => IpaTumbuhanContohView(),
      binding: IpaTumbuhanContohBinding(),
    ),
    GetPage(
      name: _Paths.IPA_HEWAN_CONTOH,
      page: () => IpaHewanContohView(),
      binding: IpaHewanContohBinding(),
    ),
    GetPage(
      name: _Paths.IPA_BENDA_PADAT,
      page: () => IpaBendaPadatView(),
      binding: IpaBendaPadatBinding(),
    ),
    GetPage(
      name: _Paths.IPA_BENDA_CAIR,
      page: () => IpaBendaCairView(),
      binding: IpaBendaCairBinding(),
    ),
    GetPage(
      name: _Paths.IPA_BENDA_GAS,
      page: () => IpaBendaGasView(),
      binding: IpaBendaGasBinding(),
    ),
    GetPage(
      name: _Paths.IPA_SIFAT_BENDA,
      page: () => IpaSifatBendaView(),
      binding: IpaSifatBendaBinding(),
    ),
    GetPage(
      name: _Paths.SUB_MATERI_IPS,
      page: () => SubMateriIpsView(),
      binding: SubMateriIpsBinding(),
    ),
    GetPage(
      name: _Paths.LINGKUNGAN_SEKITAR,
      page: () => const LingkunganSekitarView(),
      binding: LingkunganSekitarBinding(),
    ),
    GetPage(
      name: _Paths.PETA_ARAH_MATA_ANGIN,
      page: () => const PetaArahMataAnginView(),
      binding: PetaArahMataAnginBinding(),
    ),
    GetPage(
      name: _Paths.KEBUDAYAAN_TRADISI,
      page: () => const KebudayaanTradisiView(),
      binding: KebudayaanTradisiBinding(),
    ),
    GetPage(
      name: _Paths.PEKERJAAN_SEKITAR,
      page: () => const PekerjaanSekitarView(),
      binding: PekerjaanSekitarBinding(),
    ),
    GetPage(
      name: _Paths.TANGGUNG_JAWAB_SEKOLAH,
      page: () => const TanggungJawabSekolahView(),
      binding: TanggungJawabSekolahBinding(),
    ),
    GetPage(
      name: _Paths.SUBMATERI_SENI,
      page: () => const SubmateriSeniView(),
      binding: SubmateriSeniBinding(),
    ),
    GetPage(
      name: _Paths.WARNA,
      page: () => const WarnaView(),
      binding: WarnaBinding(),
    ),
    GetPage(
      name: _Paths.BENTUK,
      page: () => const BentukView(),
      binding: BentukBinding(),
    ),
    GetPage(
      name: _Paths.MELUKIS,
      page: () => const MelukisView(),
      binding: MelukisBinding(),
    ),
    GetPage(
      name: _Paths.KOLASE,
      page: () => const KolaseView(),
      binding: KolaseBinding(),
    ),
    GetPage(
      name: _Paths.KRIYA,
      page: () => const KriyaView(),
      binding: KriyaBinding(),
    ),
    GetPage(
      name: _Paths.EKSPRESI_SENI,
      page: () => const EkspresiSeniView(),
      binding: EkspresiSeniBinding(),
    ),
    GetPage(
      name: _Paths.SUBMATERI_INDONESIA,
      page: () => BahasaIndonesiaView(),
      binding: SubmateriIndonesiaBinding(),
    ),
    GetPage(
      name: _Paths.MEMBACA_CERITA,
      page: () => const MembacaCeritaView(),
      binding: MembacaCeritaBinding(),
    ),
    GetPage(
      name: _Paths.MENULIS_KALIMAT,
      page: () => const MenulisKalimatView(),
      binding: MenulisKalimatBinding(),
    ),
    GetPage(
      name: _Paths.TEKS_NARATIF,
      page: () => const TeksNaratifView(),
      binding: TeksNaratifBinding(),
    ),
    GetPage(
      name: _Paths.TEKS_DESKRIPTIF,
      page: () => const TeksDeskriptifView(),
      binding: TeksDeskriptifBinding(),
    ),
    GetPage(
      name: _Paths.PUISI_PANTUN,
      page: () => const PuisiPantunView(),
      binding: PuisiPantunBinding(),
    ),
    GetPage(
      name: _Paths.BERBICARA_DEPAN_UMUM,
      page: () => const BerbicaraDepanUmumView(),
      binding: BerbicaraDepanUmumBinding(),
    ),
    GetPage(
      name: _Paths.KUIS,
      page: () => const KuisDashboardView(),
      binding: KuisBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_BAHASA_INDONESIA,
      page: () => const KuisBahasaIndonesiaView(),
      binding: KuisBahasaIndonesiaBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_MATEMATIKA,
      page: () => MathQuizView(),
      binding: KuisMatematikaBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_IPA,
      page: () => ScienceQuizView(),
      binding: KuisIpaBinding(),
    ),
    GetPage(
      name: _Paths.KUIS_IPS,
      page: () => KuisIpsView(),
      binding: KuisIpsBinding(),
    ),
  ];
}
