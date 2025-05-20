import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiplicationView extends StatelessWidget {
  final List<Map<String, String>> examples = [
    {'question': '2 × 3', 'answer': '6'},
    {'question': '4 × 5', 'answer': '20'},
    {'question': '6 × 7', 'answer': '42'},
    {'question': '3 × 8', 'answer': '24'},
    {'question': '9 × 2', 'answer': '18'},
    {'question': '5 × 5', 'answer': '25'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: Text('Perkalian', style: TextStyle(fontFamily: 'MochiyPopOne')),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apa itu Perkalian?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'MochiyPopOne',
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Text(
                'Perkalian adalah penjumlahan berulang. Contohnya, 3 × 2 artinya 3 + 3 = 6.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Contoh Soal:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'MochiyPopOne',
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: examples.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = examples[index];
                  return Card(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['question']!,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            '= ${item['answer']!}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Kembali', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
