import 'package:flutter/material.dart';

class ColorsView extends StatelessWidget {
  final List<Map<String, dynamic>> colorsList = [
    {
      "name": "Red",
      "color": Colors.red,
      "info": "Red is the color of apples and love!"
    },
    {
      "name": "Blue",
      "color": Colors.blue,
      "info": "Blue is the color of the sky and the sea."
    },
    {
      "name": "Yellow",
      "color": Colors.yellow,
      "info": "Yellow is the color of the sun and bananas!"
    },
    {
      "name": "Green",
      "color": Colors.green,
      "info": "Green is the color of grass and leaves."
    },
    {
      "name": "Orange",
      "color": Colors.orange,
      "info": "Orange is the color of oranges and carrots."
    },
    {
      "name": "Purple",
      "color": Colors.purple,
      "info": "Purple is a royal and beautiful color."
    },
    {
      "name": "Pink",
      "color": Colors.pink,
      "info": "Pink is soft and often loved by kids."
    },
    {
      "name": "Brown",
      "color": Colors.brown,
      "info": "Brown is the color of chocolate and trees."
    },
    {
      "name": "Black",
      "color": Colors.black,
      "info": "Black is a dark and cool color."
    },
    {
      "name": "White",
      "color": Colors.white,
      "info": "White is clean like snow and clouds."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Colors",
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: colorsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final colorItem = colorsList[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(colorItem["name"]),
                    content: Text(colorItem["info"]),
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
                  color: colorItem["color"],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    colorItem["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: colorItem["name"] == "Yellow" ||
                              colorItem["name"] == "White"
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
