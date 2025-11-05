import 'package:get/get.dart';

class ContactController extends GetxController {
  final contacts = <Map<String, String>>[
    {'name': 'Rina - Ketua Panitia', 'phone': '+62 812 3456 7890', 'role': 'Ketua'},
    {'name': 'Budi - Sekretaris', 'phone': '+62 813 1111 2222', 'role': 'Sekretaris'},
    {'name': 'Aldi - Humas', 'phone': '+62 811 3333 4444', 'role': 'Humas'},
  ].obs;
}
