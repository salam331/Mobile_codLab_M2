import 'package:cod_lab2apps/app/data/services/hhtp_controller.dart';
import 'package:get/get.dart';

class HttpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpController>(
      () => HttpController(),
    );
  }
}
