import 'package:buzzex/Screens/Authentication/controllers/chatController.dart';
import 'package:get/instance_manager.dart';

import '../Screens/Authentication/controllers/Controllers.dart';

class initialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => ChatController());
  }
}
