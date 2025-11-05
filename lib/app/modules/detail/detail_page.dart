import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    final e = controller.event;
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (e.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(e.imageUrl, height: 200, fit: BoxFit.cover),
              )
            else
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.event, size: 72),
              ),
            const SizedBox(height: 12),
            Text(e.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('${e.date.day}/${e.date.month}/${e.date.year}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text(e.description),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}
