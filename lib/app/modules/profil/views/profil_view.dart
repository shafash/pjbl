import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/theme_controller.dart';

class ProfilView extends GetView<ThemeController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.isDarkMode;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profil',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- Profile Card ---
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown, width: 1.5),
                borderRadius: BorderRadius.circular(16),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shafa',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'MochiyPopOne',
                          ),
                        ),
                        Text(
                          '@shafazzhrh',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.brown,
                            fontFamily: 'MochiyPopOne',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit, color: Colors.brown),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- Menu Buttons ---
            _menuButton(title: 'ubah kata sandi', onTap: () {}),
            _menuButton(
              title: 'mode gelap/terang',
              onTap: () => controller.toggleTheme(),
            ),
            _menuButton(title: 'Log-out', onTap: () {}),

            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'More',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MochiyPopOne',
                ),
              ),
            ),
            const SizedBox(height: 8),
            _menuButton(title: 'bantuan & dukungan', onTap: () {}),
            _menuButton(title: 'tentang applikasi', onTap: () {}),

            const Spacer(),

            // --- Save Button ---
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD50000), Color(0xFFFF5252)],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'simpan',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown),
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.15),
                offset: const Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'MochiyPopOne',
              fontSize: 14,
              color: Colors.brown,
            ),
          ),
        ),
      ),
    );
  }
}
