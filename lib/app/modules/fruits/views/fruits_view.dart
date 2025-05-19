import 'package:flutter/material.dart';

class FruitsView extends StatelessWidget {
  final List<Map<String, String>> fruits = [
    {
      "name": "Apple",
      "image": "assets/fruits/apple.png",
      "info": "Apple is sweet and crunchy!"
    },
    {
      "name": "Banana",
      "image": "assets/fruits/banana.png",
      "info": "Bananas are full of energy."
    },
    {
      "name": "Orange",
      "image": "assets/fruits/orange.png",
      "info": "Oranges are juicy and rich in vitamin C."
    },
    {
      "name": "Grapes",
      "image": "assets/fruits/grapes.png",
      "info": "Grapes grow in bunches."
    },
    {
      "name": "Watermelon",
      "image": "assets/fruits/watermelon.png",
      "info": "Watermelon is refreshing and sweet."
    },
    {
      "name": "Pineapple",
      "image": "assets/fruits/pineapple.png",
      "info": "Pineapple has a spiky outside but is tasty inside."
    },
    {
      "name": "Strawberry",
      "image": "assets/fruits/strawberry.png",
      "info": "Strawberries are bright red and yummy."
    },
    {
      "name": "Mango",
      "image": "assets/fruits/mango.png",
      "info": "Mangoes are called the king of fruits."
    },
    {
      "name": "Papaya",
      "image": "assets/fruits/papaya.png",
      "info": "Papayas are sweet and orange inside."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fruits",
          style: TextStyle(
            fontFamily: 'MochiyPopOne', // <-- pakai font MochiyPopOne
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.orange[50],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: fruits.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final fruit = fruits[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(fruit["name"]!),
                    content: Text(fruit["info"]!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          fruit["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      fruit["name"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.deepOrange,
                      ),
                    ),
                    SizedBox(height: 12),
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
