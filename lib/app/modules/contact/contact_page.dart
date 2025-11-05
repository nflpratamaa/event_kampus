import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contact_controller.dart';
import '../../widgets/app_drawer.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panitia & Kontak')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: controller.contacts.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final c = controller.contacts[index];
            return ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(c['name'] ?? ''),
              subtitle: Text(c['role'] ?? ''),
              trailing: Text(c['phone'] ?? ''),
            );
          },
        ),
      ),
    );
  }
}
