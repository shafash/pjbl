import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';
import '../../../routes/app_pages.dart';

class ProfilView extends GetView<ThemeController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 24,
            color: isDark ? Colors.white : Colors.brown.shade800,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.brown.shade800,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileCard(isDark),
            const SizedBox(height: 24),
            _menuButton(
              title: 'ubah kata sandi',
              onTap: () => Get.toNamed(Routes.UBAH_KATA_SANDI),
              isDark: isDark,
            ),
            _menuButton(
              title: 'mode gelap/terang',
              onTap: () => controller.toggleTheme(),
              isDark: isDark,
            ),
            _menuButton(
              title: 'Log-out',
              onTap: () => Get.toNamed(Routes.LOGOUT_CONFIRM),
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'More',
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.brown.shade800,
                ),
              ),
            ),
            const SizedBox(height: 12),
            _menuButton(
              title: 'bantuan & dukungan',
              onTap: () {},
              isDark: isDark,
            ),
            _menuButton(
              title: 'tentang applikasi',
              onTap: () {},
              isDark: isDark,
            ),
            const Spacer(),
            _buildSimpanButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDark ? Colors.white70 : Colors.brown,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'shafa',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'MochiyPopOne',
                    color: isDark ? Colors.white : Colors.brown,
                  ),
                ),
                Text(
                  '@shafazzhrh',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'MochiyPopOne',
                    color: isDark ? Colors.white70 : Colors.brown,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.edit, color: isDark ? Colors.white : Colors.brown),
        ],
      ),
    );
  }

  Widget _menuButton({
    required String title,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: isDark ? Colors.white70 : Colors.brown),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'MochiyPopOne',
              fontSize: 14,
              color: isDark ? Colors.white : Colors.brown,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSimpanButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD50000), Color(0xFFFF5252)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 4)),
        ],
      ),
      child: TextButton(
        onPressed: () => Get.offAllNamed(Routes.DASHBOARD),
        child: const Text(
          'simpan',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
