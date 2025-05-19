import 'package:flutter/material.dart';

class ClothesView extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      "name": "T-Shirt",
      "image": "assets/clothes/tshirt.png",
      "info": "A t-shirt is a casual top you wear every day!"
    },
    {
      "name": "Pants",
      "image": "assets/clothes/pants.png",
      "info": "Pants cover your legs and keep you warm."
    },
    {
      "name": "Skirt",
      "image": "assets/clothes/skirt.png",
      "info": "A skirt is a pretty bottom wear for girls."
    },
    {
      "name": "Jacket",
      "image": "assets/clothes/jacket.png",
      "info": "Jackets keep you warm on cold days."
    },
    {
      "name": "Hat",
      "image": "assets/clothes/hat.png",
      "info": "A hat protects you from the sun!"
    },
    {
      "name": "Shoes",
      "image": "assets/clothes/shoes.png",
      "info": "Shoes protect your feet and help you walk."
    },
    {
      "name": "Shorts",
      "image": "assets/clothes/shorts.png",
      "info": "Shorts are great for warm weather!"
    },
    {
      "name": "Dress",
      "image": "assets/clothes/dress.png",
      "info": "A dress is a one-piece outfit."
    },
    {
      "name": "Sweater",
      "image": "assets/clothes/sweater.png",
      "info": "Sweaters keep you cozy in winter!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Clothes",
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: clothes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final cloth = clothes[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(cloth["name"]!),
                    content: Text(cloth["info"]!),
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
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
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
                          cloth["image"]!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      cloth["name"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.blue[800],
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
