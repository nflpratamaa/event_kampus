import 'package:get/get.dart';
import '../home/home_controller.dart';

class AgendaController extends GetxController {
  final HomeController home = Get.find();

  List<EventModel> eventsThisWeek() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return home.events.where((e) => e.date.isAfter(startOfWeek.subtract(const Duration(seconds: 1))) && e.date.isBefore(endOfWeek.add(const Duration(days: 1)))).toList();
  }
}
