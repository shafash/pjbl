import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TanggungJawabSekolahView extends StatelessWidget {
  const TanggungJawabSekolahView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'title': 'Datang Tepat Waktu',
        'desc':
            'Masuk sekolah tidak terlambat supaya bisa ikut pelajaran dari awal.',
        'icon': Icons.access_time_filled,
        'color': Colors.blue.shade100,
      },
      {
        'title': 'Mengerjakan Tugas',
        'desc':
            'Mengerjakan PR dan tugas yang diberikan guru dengan sungguh-sungguh.',
        'icon': Icons.assignment_turned_in,
        'color': Colors.orange.shade100,
      },
      {
        'title': 'Menjaga Kebersihan',
        'desc':
            'Membuang sampah pada tempatnya dan membersihkan kelas bersama.',
        'icon': Icons.clean_hands,
        'color': Colors.green.shade100,
      },
      {
        'title': 'Menghormati Guru',
        'desc': 'Mendengarkan dan bersikap sopan kepada guru saat belajar.',
        'icon': Icons.volunteer_activism,
        'color': Colors.purple.shade100,
      },
      {
        'title': 'Berbuat Baik ke Teman',
        'desc': 'Berteman dengan ramah dan membantu teman yang kesulitan.',
        'icon': Icons.emoji_people,
        'color': Colors.pink.shade100,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF8),
      appBar: AppBar(
        title: Text(
          'Tanggung Jawab di Sekolah',
          style: GoogleFonts.mochiyPopOne(
            fontSize: 20,
            color: Colors.teal.shade900,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade100,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Sebagai siswa yang baik, kita harus bertanggung jawab di sekolah!',
              style: GoogleFonts.mochiyPopOne(
                fontSize: 15,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: item['color'] as Color,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (item['color'] as Color).withOpacity(0.5),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(item['icon'] as IconData,
                            size: 36, color: Colors.white),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] as String,
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 17,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['desc'] as String,
                                style: GoogleFonts.mochiyPopOne(
                                  fontSize: 13,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
