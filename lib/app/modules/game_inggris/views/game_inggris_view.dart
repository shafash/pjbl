import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnglishGamesView extends StatelessWidget {
  const EnglishGamesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> games = [
      {
        'title': 'Find the Missing Letter',
        'description': 'Tebak huruf yang hilang!',
        'route': '/find-letter-game',
        'color': const Color(0xFFFFF0F5),
        'icon': Icons.text_fields,
      },
      {
        'title': 'Match Word with Picture',
        'description': 'Cocokkan kata dengan gambarnya',
        'route': '/match-word-picture',
        'color': const Color(0xFFD1C4E9),
        'icon': Icons.image_search,
      },
      {
        'title': 'Matching Cards Game',
        'description': 'Cocokkan kartu bergambar yang sama!',
        'route': '/english-matching-game',
        'color': const Color(0xFFB2EBF2),
        'icon': Icons.memory,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF0F5),
        elevation: 0,
        title: const Text(
          'Game Bahasa Inggris',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: const Color(0xFFFFF0F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: games.length,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) {
            final game = games[index];
            return GestureDetector(
              onTap: () => Get.toNamed(game['route']),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                decoration: BoxDecoration(
                  color: game['color'],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(
                        game['icon'],
                        size: 32,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            game['title'],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MochiyPopOne',
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            game['description'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'MochiyPopOne',
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.deepPurpleAccent,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
