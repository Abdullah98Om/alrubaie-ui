import 'package:alrubaie/controller/slider_controller.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import '../controller/order_controller.dart';
import '../controller/searchs_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => SearchsController(), fenix: true);

    Get.lazyPut(() => OrderController(), fenix: true);
    Get.lazyPut(() => SliderController(), fenix: true);
  }
}
