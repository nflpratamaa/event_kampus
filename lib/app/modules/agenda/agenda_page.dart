import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'agenda_controller.dart';
import '../home/home_controller.dart';
import '../../widgets/event_card.dart';
import '../../widgets/app_drawer.dart';
import '../../routes/app_pages.dart';

class AgendaPage extends StatelessWidget {
  AgendaPage({super.key});

  final AgendaController controller = Get.put(AgendaController());
  final HomeController home = Get.find();

  @override
  Widget build(BuildContext context) {
    final events = controller.eventsThisWeek();
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda Minggu Ini')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: events.isEmpty
            ? const Center(child: Text('Tidak ada agenda minggu ini'))
            : ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final e = events[index];
                  return EventCard(event: e, onTap: () => Get.toNamed(Routes.DETAIL, arguments: e));
                },
              ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
