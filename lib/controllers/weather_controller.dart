import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/api/fetch_api.dart';
import 'package:weatherapp/model/weather_class.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();
  final RxInt selectedIndex = 0.obs;
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final weatherData = WeatherData().obs;

  // instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble latitude() => _latitude;
  RxDouble longitude() => _longitude;
  getWeatherData() => weatherData.value;

  void onItemTap(int index) {
    selectedIndex.value = index;
  }

  bool isSelect(int index) {
    bool isSelected = selectedIndex.value == index;
    return isSelected;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    //return if service is not enabled
    if (!isServiceEnabled) {
      return Future.error('Location service is not enabled');
    }

    // status of permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied');
      }
    }
    //getting the right location
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then(
      (value) {
        _latitude.value = value.latitude;
        _longitude.value = value.longitude;
        return FetchWeatherData()
            .getWeatherData(value.latitude, value.longitude)
            .then(
          (value) {
            weatherData.value = value;
            _isLoading.value = false;
          },
        );
      },
    );
  }
}
