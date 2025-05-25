import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart';

class GameHubView extends StatelessWidget {
  GameHubView({Key? key}) : super(key: key);

  final List<GameInfo> games = [
    GameInfo(
      title: 'Monopoli Negara',
      emoji: '🌍',
      description: 'Tebak negara dari petunjuk dan jelajahi dunia!',
      routeName: Routes.GAME_MONOPOLI,
    ),
    GameInfo(
      title: 'Matematika Asiikkkk',
      emoji: '➗',
      description: 'Asah kemampuan hitungmu dengan kuis seru!',
      routeName: Routes.GAME_MATEMATIKA,
    ),
    GameInfo(
      title: 'Bahasa Inggris Seru',
      emoji: '📚',
      description: 'Belajar kosa kata Inggris lewat permainan!',
      routeName: Routes.GAME_INGGRIS,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pastelBackground = Color(0xFFFFF8E1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC1CC),
        title:
            Text('Game Edukatif', style: TextStyle(fontFamily: 'MochiyPopOne')),
      ),
      backgroundColor: pastelBackground,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFFFF3B0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      game.emoji,
                      style: TextStyle(fontSize: 56),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            game.title,
                            style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            game.description,
                            style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(game.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFC1CC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: Text('Mainkan',
                          style: TextStyle(fontFamily: 'MochiyPopOne')),
                    ),
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

class GameInfo {
  final String title;
  final String emoji;
  final String description;
  final String routeName;

  GameInfo({
    required this.title,
    required this.emoji,
    required this.description,
    required this.routeName,
  });
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontFamily: 'MochiyPopOne')),
        backgroundColor: Color(0xFFFFC1CC),
      ),
      body: Center(
        child: Text(
          'Game "$title" belum tersedia.\nNantikan update selanjutnya!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 20,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
