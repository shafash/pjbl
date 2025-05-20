import 'package:flutter/material.dart';

class AdditionView extends StatelessWidget {
  final List<Map<String, String>> questions = [
    {"question": "2 + 3 =", "answer": "5"},
    {"question": "4 + 1 =", "answer": "5"},
    {"question": "6 + 2 =", "answer": "8"},
    {"question": "5 + 5 =", "answer": "10"},
    {"question": "3 + 7 =", "answer": "10"},
    {"question": "9 + 0 =", "answer": "9"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Belajar Penjumlahan',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      backgroundColor: Colors.green[50],
      body: ListView.builder(
        itemCount: questions.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final item = questions[index];
          return Card(
            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(Icons.calculate, color: Colors.green, size: 32),
              title: Text(
                item['question']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Jawaban"),
                      content: Text("${item['question']} ${item['answer']}"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Tutup"),
                        )
                      ],
                    ),
                  );
                },
                child: Text("Lihat"),
              ),
            ),
          );
        },
      ),
    );
  }
}
