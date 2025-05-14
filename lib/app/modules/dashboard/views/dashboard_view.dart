import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.settings, color: Colors.brown),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profil.png'),
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Greeting
              Obx(
                () => Text(
                  "Hai ${controller.userName.value}!!",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  onFieldSubmitted: (query) {
                    controller.searchQuery.value = query.trim().toLowerCase();
                  },
                  decoration: const InputDecoration(
                    hintText: 'Cari...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.brown),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Small Buttons with Tooltip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(controller.smallButtons.length, (
                  index,
                ) {
                  final btn = controller.smallButtons[index];
                  return GestureDetector(
                    onTap: () {
                      final route = btn['route'];
                      if (route != null && route.isNotEmpty) {
                        Get.toNamed(route);
                      }
                    },
                    child: MouseRegion(
                      onEnter: (_) => controller.setHover(index, true),
                      onExit: (_) => controller.setHover(index, false),
                      child: Obx(() {
                        final isHovering = controller.hoverStates[index].value;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.brown, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(btn['icon']!, height: 24),
                              if (isHovering) ...[
                                const SizedBox(width: 8),
                                Text(
                                  btn['label']!,
                                  style: const TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Subject Cards
              Expanded(
                child: Obx(() {
                  final search = controller.searchQuery.value;
                  final filteredSubjects =
                      controller.subjects
                          .where(
                            (subject) =>
                                subject['name']!.toLowerCase().contains(search),
                          )
                          .take(6)
                          .toList();

                  return GridView.builder(
                    itemCount: filteredSubjects.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 3 / 4,
                        ),
                    itemBuilder: (context, index) {
                      final subject = filteredSubjects[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(subject['route']!),
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
                                subject['icon']!,
                                height: 80,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Icon(Icons.image_not_supported),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                subject['name']!,
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
