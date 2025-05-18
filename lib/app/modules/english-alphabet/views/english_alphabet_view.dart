import 'package:flutter/material.dart';

class EnglishAlphabetSwiperView extends StatefulWidget {
  const EnglishAlphabetSwiperView({super.key});

  @override
  State<EnglishAlphabetSwiperView> createState() =>
      _EnglishAlphabetSwiperViewState();
}

class _EnglishAlphabetSwiperViewState extends State<EnglishAlphabetSwiperView> {
  final List<Map<String, dynamic>> alphabetData = [
    {
      'letter': 'Aa',
      'word': 'Apple',
      'image': 'assets/alphabet/A.png',
      'color': Color(0xFFFF3B30)
    },
    {
      'letter': 'Bb',
      'word': 'Banana',
      'image': 'assets/alphabet/B.png',
      'color': Color(0xFFFFD60A)
    },
    {
      'letter': 'Cc',
      'word': 'Car',
      'image': 'assets/alphabet/C.png',
      'color': Color(0xFF007AFF)
    },
    {
      'letter': 'Dd',
      'word': 'Dog',
      'image': 'assets/alphabet/D.png',
      'color': Color(0xFFA2845E)
    },
    {
      'letter': 'Ee',
      'word': 'Elephant',
      'image': 'assets/alphabet/E.png',
      'color': Color(0xFF8E8E93)
    },
    {
      'letter': 'Ff',
      'word': 'Frog',
      'image': 'assets/alphabet/F.png',
      'color': Color(0xFF34C759)
    },
    {
      'letter': 'Gg',
      'word': 'Grapes',
      'image': 'assets/alphabet/G.png',
      'color': Color(0xFFAF52DE)
    },
    {
      'letter': 'Hh',
      'word': 'House',
      'image': 'assets/alphabet/H.png',
      'color': Color(0xFFFF9F0A)
    },
    {
      'letter': 'Ii',
      'word': 'Ice Cream',
      'image': 'assets/alphabet/I.png',
      'color': Color(0xFFFFCCCB)
    },
    {
      'letter': 'Jj',
      'word': 'Jellyfish',
      'image': 'assets/alphabet/J.png',
      'color': Color(0xFF5AC8FA)
    },
    {
      'letter': 'Kk',
      'word': 'Kite',
      'image': 'assets/alphabet/K.png',
      'color': Color(0xFFFF2D55)
    },
    {
      'letter': 'Ll',
      'word': 'Lion',
      'image': 'assets/alphabet/L.png',
      'color': Color(0xFFFFD700)
    },
    {
      'letter': 'Mm',
      'word': 'Moon',
      'image': 'assets/alphabet/M.png',
      'color': Color(0xFFC7C7CC)
    },
    {
      'letter': 'Nn',
      'word': 'Nest',
      'image': 'assets/alphabet/N.png',
      'color': Color(0xFFA0522D)
    },
    {
      'letter': 'Oo',
      'word': 'Orange',
      'image': 'assets/alphabet/O.png',
      'color': Color(0xFFFF9500)
    },
    {
      'letter': 'Pp',
      'word': 'Penguin',
      'image': 'assets/alphabet/P.png',
      'color': Color(0xFF1C1C1E)
    },
    {
      'letter': 'Qq',
      'word': 'Queen',
      'image': 'assets/alphabet/Q.png',
      'color': Color(0xFFDAA520)
    },
    {
      'letter': 'Rr',
      'word': 'Rainbow',
      'image': 'assets/alphabet/R.png',
      'color': Color(0xFFFF5E3A)
    },
    {
      'letter': 'Ss',
      'word': 'Sun',
      'image': 'assets/alphabet/S.png',
      'color': Color(0xFFFFD700)
    },
    {
      'letter': 'Tt',
      'word': 'Tree',
      'image': 'assets/alphabet/T.png',
      'color': Color(0xFF228B22)
    },
    {
      'letter': 'Uu',
      'word': 'Umbrella',
      'image': 'assets/alphabet/U.png',
      'color': Color(0xFF5E5CE6)
    },
    {
      'letter': 'Vv',
      'word': 'Violin',
      'image': 'assets/alphabet/V.png',
      'color': Color(0xFF8B4513)
    },
    {
      'letter': 'Ww',
      'word': 'Watermelon',
      'image': 'assets/alphabet/W.png',
      'color': Color(0xFFFF3B30)
    },
    {
      'letter': 'Xx',
      'word': 'Xylophone',
      'image': 'assets/alphabet/X.png',
      'color': Color(0xFFFF96B4)
    },
    {
      'letter': 'Yy',
      'word': 'Yacht',
      'image': 'assets/alphabet/Y.png',
      'color': Color(0xFF00BFFF)
    },
    {
      'letter': 'Zz',
      'word': 'Zebra',
      'image': 'assets/alphabet/Z.png',
      'color': Color(0xFFD1D1D6)
    },
  ];

  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
    _pageController.addListener(() {
      final page = _pageController.page;
      if (page != null && page.round() != _currentIndex) {
        setState(() {
          _currentIndex = page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        alphabetData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: _currentIndex == index ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentIndex == index ? Colors.white : Colors.white54,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: alphabetData.length,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = alphabetData[index];
              return Container(
                color: item['color'],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Contoh Materi",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontFamily: 'MochiyPopOne',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['letter'],
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'MochiyPopOne',
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Image.asset(
                          item['image'],
                          height: 160,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          item['word'],
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'MochiyPopOne',
                            shadows: [
                              Shadow(
                                color: Colors.black38,
                                offset: Offset(1, 1),
                                blurRadius: 3,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildIndicator(),
          ),
          if (_currentIndex > 0)
            Positioned(
              left: 8,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 40),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                splashRadius: 28,
                tooltip: 'Sebelumnya',
              ),
            ),
          if (_currentIndex < alphabetData.length - 1)
            Positioned(
              right: 8,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 40),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                splashRadius: 28,
                tooltip: 'Berikutnya',
              ),
            ),
        ],
      ),
    );
  }
}
