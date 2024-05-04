import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  var connectionStatus = 'Checking connection...'.obs;

  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      if (result is ConnectivityResult) {
        _updateConnectionStatus(ConnectivityResult.wifi);
      } else {
        connectionStatus.value = 'Unexpected result type';
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      final result = await _connectivity.checkConnectivity();
      _updateConnectionStatus(ConnectivityResult.wifi);
    } catch (e) {
      connectionStatus.value = 'Failed to get connectivity: $e';
    }
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        connectionStatus.value = 'Connected to Internet';
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 'No Connection';
        break;
      default:
        connectionStatus.value = 'Failed to get connectivity.';
        break;
    }
    Get.snackbar(
      'Connectivity Update',
      connectionStatus.value,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}