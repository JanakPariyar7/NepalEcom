import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  Future<void> _updateConnectionStatus(
    List<ConnectivityResult> resultList,
  ) async {
    final result = resultList.firstWhere(
      (element) => element != ConnectivityResult.none,
      orElse: () => ConnectivityResult.none,
    );

    _connectionStatus.value = result;

    if (_connectionStatus.value == ConnectivityResult.none) {
      JsnackBar.successSnackBar(title: "No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final resultList = await _connectivity.checkConnectivity();
      return resultList.isNotEmpty &&
          resultList.any((e) => e != ConnectivityResult.none);
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
