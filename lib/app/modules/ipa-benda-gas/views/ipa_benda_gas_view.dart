import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IpaBendaGasView extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'name': 'Udara',
      'image': 'assets/benda gas/udara.png',
    },
    {
      'name': 'Asap',
      'image': 'assets/benda gas/asap.png',
    },
    {
      'name': 'Uap Air',
      'image': 'assets/benda gas/uap air.png',
    },
    {
      'name': 'Karbon Dioksida',
      'image': 'assets/benda gas/co2.png',
    },
    {
      'name': 'Oksigen',
      'image': 'assets/benda gas/oksigen.png',
    },
    {
      'name': 'Gas Alam',
      'image': 'assets/benda gas/gas alam.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      appBar: AppBar(
        title: Text(
          'Benda Gas',
          style: GoogleFonts.mochiyPopOne(),
        ),
        backgroundColor: Colors.orangeAccent.shade700,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.black12,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(item['image'], height: 80),
                const SizedBox(height: 10),
                Text(
                  item['name'],
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mochiyPopOne(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
