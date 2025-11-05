import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../widgets/event_card.dart';
import '../../widgets/app_drawer.dart';
import '../../routes/app_pages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Kegiatan Kampus'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          final events = controller.events;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final e = events[index];
              return EventCard(
                event: e,
                onTap: () => Get.toNamed(Routes.DETAIL, arguments: e),
              );
            },
          );
        }),
      ),
    );
  }
}
