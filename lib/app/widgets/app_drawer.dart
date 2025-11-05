import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, String route) {
    // close drawer first
    Navigator.of(context).pop();
    // navigate after closing drawer
    Future.microtask(() => Get.toNamed(route));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(radius: 28, child: Icon(Icons.school, size: 36)),
                  SizedBox(height: 8),
                  Text('Informasi Kegiatan Kampus', style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _go(context, Routes.HOME),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Agenda Minggu Ini'),
              onTap: () => _go(context, Routes.AGENDA),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Panitia & Kontak'),
              onTap: () => _go(context, Routes.CONTACT),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Aplikasi'),
              onTap: () => _go(context, Routes.ABOUT),
            ),
          ],
        ),
      ),
    );
  }
}
