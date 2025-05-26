import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, bool> badges = {
      '🏅 Alphabet Game': true,
      '🔠 Missing Letter': true,
      '🎌 Flags Game': false,
      '🍓 Fruit Match': true,
      '🧠 Word Match': false,
      '📚 Quiz Master': false,
      '🎨 Color Match': true,
      '📝 Spell Bee': false,
      '🚩 Country Quiz': false,
    };

    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF0F5),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profil 🧒',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.pinkAccent,
                    child: Text(
                      '👧',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'anakcerdas123',
                    style: TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'anakcerdas@email.com',
                    style: TextStyle(
                      fontFamily: 'MochiyPopOne',
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            _buildButton(
              icon: Icons.edit,
              label: 'Ganti Username',
              onTap: () => Get.toNamed('/ubah-username'),
            ),
            _buildButton(
              icon: Icons.lock,
              label: 'Ganti Password',
              onTap: () => Get.toNamed('/ubah-kata-sandi'),
            ),

            const SizedBox(height: 32),

            const Text(
              '🎖️ Badge yang Kamu Dapatkan:',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'MochiyPopOne',
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),

            // 4 badge pertama
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: badges.entries.take(4).map((entry) {
                return _buildBadge(context, entry.key, entry.value);
              }).toList(),
            ),
            const SizedBox(height: 12),

            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () => _showAllBadgesDialog(context, badges),
                icon: const Icon(Icons.visibility),
                label: const Text(
                  'Lihat Semua Badge',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.deepPurpleAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 16),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios_rounded,
                    size: 16, color: Colors.deepPurple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(BuildContext context, String title, bool unlocked) {
    final color = unlocked ? const Color(0xFFD1C4E9) : const Color(0xFFE0E0E0);

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: const Color(0xFFFFF7FB),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: const Text(
              'Info Badge',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  unlocked
                      ? '🎉 Badge ini sudah kamu buka!'
                      : '🔒 Belum terbuka. Yuk selesaikan tantangannya!',
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'MochiyPopOne',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Tutup',
                  style: TextStyle(
                    fontFamily: 'MochiyPopOne',
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              )
            ],
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title.split(' ')[0],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 8),
            Text(
              title.split(' ').sublist(1).join(' '),
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 14,
                color: unlocked ? Colors.deepPurple : Colors.black38,
              ),
            ),
            const SizedBox(width: 6),
            Text(unlocked ? '🎉' : '🔒'),
          ],
        ),
      ),
    );
  }

  void _showAllBadgesDialog(BuildContext context, Map<String, bool> allBadges) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFF7FB),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            '🎖️ Semua Badge',
            style: TextStyle(
              fontFamily: 'MochiyPopOne',
              fontSize: 20,
              color: Colors.deepPurple,
            ),
          ),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: allBadges.entries.map((entry) {
                return _buildBadge(context, entry.key, entry.value);
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Tutup',
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                  fontSize: 16,
                  color: Colors.deepPurple,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
