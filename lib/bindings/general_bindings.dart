import 'package:ecom/utils/http/network_management.dart';
import 'package:get/instance_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}
