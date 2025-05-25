import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dashboard_controller.dart';
import 'package:kelas_pintar/app/routes/app_pages.dart'; // pastikan ini import route-nya

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF3), // krem lembut
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFBF3),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.person, color: Colors.brown),
          onPressed: () => Get.toNamed(Routes.PROFIL), // route profil
          tooltip: 'Profil',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.brown),
            onPressed: () => Get.toNamed(Routes.SETTING), // route setting
            tooltip: 'Setting',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hai, ${controller.userName.value}!',
                style: GoogleFonts.mochiyPopOne(
                  fontSize: 20,
                  color: Colors.brown.shade700,
                ),
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                onChanged: (value) => controller.searchQuery.value = value,
                decoration: InputDecoration(
                  hintText: 'Cari materi...',
                  hintStyle: const TextStyle(color: Colors.brown),
                  prefixIcon: const Icon(Icons.search, color: Colors.brown),
                  filled: true,
                  fillColor: Colors.brown.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol kecil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(controller.smallButtons.length, (index) {
                  final button = controller.smallButtons[index];
                  final pastelColors = [
                    Colors.pink.shade100,
                    Colors.green.shade100,
                    Colors.yellow.shade100,
                    Colors.blue.shade100,
                  ];
                  return GestureDetector(
                    onTap: () => Get.toNamed(button['route']!),
                    child: Column(
                      children: [
                        MouseRegion(
                          onEnter: (_) => controller.setHover(index, true),
                          onExit: (_) => controller.setHover(index, false),
                          child: Obx(() {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.hoverStates[index].value
                                    ? pastelColors[index].withOpacity(0.8)
                                    : pastelColors[index],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(button['icon']!,
                                    fit: BoxFit.contain),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 4),
                        Text(button['label']!,
                            style: const TextStyle(color: Colors.brown)),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Subject grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: controller.frequentlyVisitedSubjects.map((subject) {
                    return GestureDetector(
                      onTap: () {
                        controller.recordVisit(subject['route']!);
                        controller.goToSubject(subject['route']!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.orange.shade100],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.orange.shade100,
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(subject['icon']!, height: 80),
                            const SizedBox(height: 10),
                            Text(
                              subject['name']!,
                              style: GoogleFonts.mochiyPopOne(
                                fontSize: 16,
                                color: Colors.brown.shade800,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
