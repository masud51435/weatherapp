import 'package:get/get.dart';

class WeatherController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
}
