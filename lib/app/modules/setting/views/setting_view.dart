import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/controllers/audio_controller.dart';
import 'package:kelas_pintar/app/controllers/theme_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final AudioController audioController = Get.find<AudioController>();
    final ThemeController themeController = Get.find<ThemeController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF0F5),
        elevation: 0,
        title: const Text(
          'Settings ⚙️',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Obx(() => _buildSettingCard(
                icon: Icons.color_lens,
                title: "Theme Mode",
                subtitle: themeController.isDarkMode.value
                    ? "Dark Mode 🌙"
                    : "Light Mode ☀️",
                onTap: () => themeController.toggleTheme(),
              )),
          const SizedBox(height: 20),
          _buildSettingCard(
            icon: Icons.volume_up,
            title: "Background Music",
            subtitle: "Volume & mute control 🎵",
            onTap: () => _showMusicControlBottomSheet(context, audioController),
          ),
          const SizedBox(height: 20),
          _buildSettingCard(
            icon: Icons.language,
            title: "App Language",
            subtitle: "English 🇬🇧 / Indonesia 🇮🇩",
            onTap: () {
              Get.snackbar(
                "Coming Soon!",
                "Fitur pilihan bahasa belum tersedia",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.white,
                colorText: Colors.deepPurple,
                duration: const Duration(seconds: 2),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSettingCard(
            icon: Icons.logout,
            title: "Log Out",
            subtitle: "Keluar dari akun 🚪",
            onTap: () => Get.toNamed('/logout-confirm'),
          ),
        ],
      ),
    );
  }

  void _showMusicControlBottomSheet(
      BuildContext context, AudioController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Background Music Control",
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      const Icon(Icons.volume_down),
                      Expanded(
                        child: Slider(
                          value: controller.volume.value,
                          min: 0,
                          max: 1,
                          divisions: 10,
                          label: (controller.volume.value * 100)
                              .round()
                              .toString(),
                          onChanged: controller.setVolume,
                        ),
                      ),
                      const Icon(Icons.volume_up),
                    ],
                  )),
              const SizedBox(height: 10),
              Obx(() => SwitchListTile.adaptive(
                    title: const Text("Mute Music"),
                    value: controller.isMuted.value,
                    onChanged: (value) => controller.toggleMute(),
                  )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.pink[100],
              child: Icon(icon, size: 30, color: Colors.deepPurple),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 18, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
