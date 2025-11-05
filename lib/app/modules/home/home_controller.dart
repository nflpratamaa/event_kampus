import 'package:get/get.dart';

class EventModel {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final String imageUrl;

  EventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.imageUrl,
  });
}

class HomeController extends GetxController {
  final events = <EventModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // sample events
    events.assignAll([
      EventModel(
        id: '1',
        title: 'Pekan Kreativitas Mahasiswa',
        date: DateTime.now().add(const Duration(days: 1)),
        description: 'Pameran karya dan lomba antar prodi.',
        imageUrl: 'assets/images/pkm.jpg',
      ),
      EventModel(
        id: '2',
        title: 'Seminar Teknologi Informasi',
        date: DateTime.now().add(const Duration(days: 3)),
        description: 'Seminar tentang AI dan pengembangan aplikasi.',
        imageUrl: 'assets/images/seminar.jpeg',
      ),
      EventModel(
        id: '3',
        title: 'Lomba Debat Kampus',
        date: DateTime.now().add(const Duration(days: 8)),
        description: 'Kompetisi debat antar fakultas.',
        imageUrl: 'assets/images/debat.jpg',
      ),
      EventModel(
        id: '4',
        title: 'Workshop Fotografi',
        date: DateTime.now().subtract(const Duration(days: 2)),
        description: 'Belajar teknik fotografi dasar sampai lanjutan.',
        imageUrl: 'assets/images/workshop.jpeg',
      ),
    ]);
  }

  EventModel? findById(String id) {
    return events.firstWhereOrNull((e) => e.id == id);
  }
}
