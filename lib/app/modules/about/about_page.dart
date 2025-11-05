import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_controller.dart';
import '../../widgets/app_drawer.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final AboutController controller = Get.put(AboutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 36, child: Icon(Icons.info_outline, size: 40)),
            const SizedBox(height: 12),
            Text(controller.title.value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(controller.description.value),
          ],
        ),
      ),
    );
  }
}
