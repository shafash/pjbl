import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // sesuai screenshot
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW: settings & profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.settings, color: Colors.red),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // GREETING
              Text(
                "Hai ${controller.userName}!!",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 16),

              // SEARCH BAR
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 4 SMALL BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    controller.smallButtons.map((btn) {
                      return Tooltip(
                        message: btn['tooltip']!,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white,
                          child: Image.asset(btn['icon']!, height: 24),
                          foregroundColor: Colors.red,
                          // add border
                        ),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),

              // SUBJECT CARDS
              Expanded(
                child: Obx(() {
                  final subjects = controller.subjects.take(6).toList();
                  return GridView.builder(
                    itemCount: subjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3 / 4,
                        ),
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(subject['route'] as String);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.brown),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                subject['icon'] as String,
                                height: 80,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                subject['name'] as String,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
