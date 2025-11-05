import 'package:get/get.dart';
import '../home/home_controller.dart';

class DetailController extends GetxController {
  late EventModel event;

  @override
  void onInit() {
    super.onInit();
    final arg = Get.arguments;
    if (arg is EventModel) {
      event = arg;
    } else {
      // fallback empty event
      event = EventModel(id: '0', title: 'Unknown', date: DateTime.now(), description: '-', imageUrl: '');
    }
  }
}
