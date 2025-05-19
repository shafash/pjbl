import 'package:flutter/material.dart';

class ShapesView extends StatelessWidget {
  final List<Map<String, dynamic>> shapes = [
    {
      "name": "Circle",
      "icon": Icons.circle,
      "color": Colors.redAccent,
      "info": "Circle is round like a ball!"
    },
    {
      "name": "Square",
      "icon": Icons.square,
      "color": Colors.blueAccent,
      "info": "Square has 4 equal sides!"
    },
    {
      "name": "Triangle",
      "icon": Icons.change_history, // triangle icon
      "color": Colors.green,
      "info": "Triangle has 3 sharp corners!"
    },
    {
      "name": "Rectangle",
      "icon": Icons.crop_16_9,
      "color": Colors.orangeAccent,
      "info": "Rectangle looks like a door!"
    },
    {
      "name": "Star",
      "icon": Icons.star,
      "color": Colors.yellow.shade700,
      "info": "Stars twinkle in the night sky!"
    },
    {
      "name": "Heart",
      "icon": Icons.favorite,
      "color": Colors.pinkAccent,
      "info": "Heart means love and care!"
    },
    {
      "name": "Oval",
      "icon": Icons.egg, // approximate oval
      "color": Colors.purple,
      "info": "Oval looks like an egg!"
    },
    {
      "name": "Diamond",
      "icon": Icons.diamond,
      "color": Colors.teal,
      "info": "Diamond is shiny and has sharp corners!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shapes',
          style: TextStyle(
            fontFamily: 'MochiyPopOne',
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: GridView.builder(
          itemCount: shapes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final shape = shapes[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(shape['name']),
                    content: Text(shape['info']),
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
                  color: shape['color'],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      shape['icon'],
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 12),
                    Text(
                      shape['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
