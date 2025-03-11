// import 'package:get/get.dart';
// import 'package:restone/controller/navbar_controller.dart';

// import '../controller/cartController.dart';
// import '../controller/favorit_controller.dart';
// import '../controller/home_controller.dart';
// import '../controller/myMapController.dart';
// import '../controller/orderController.dart';
// // import 'package:manager_restone/controller/Detaile_controller.dart';
// // import 'package:manager_restone/controller/drawer_controller.dart';
// // import 'package:manager_restone/controller/drivers_controller.dart';
// // // import 'package:rest_one/controller/card_controller.dart';
// // // import 'package:rest_one/controller/favorit_controller.dart';
// // import 'package:manager_restone/controller/home_controller.dart';
// // import 'package:manager_restone/controller/product_controller.dart';
// // import 'package:manager_restone/controller/section_controller.dart';
// // import 'package:rest_one/controller/navbar_controller.dart';
// // import 'package:rest_one/controller/order_controller.dart';
// // import 'package:rest_one/controller/product_controller.dart';

import 'package:alrubaie/controller/slider_controller.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import '../controller/order_controller.dart';
import '../controller/searchs_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<CartController>(CartController(), permanent: true);
    //
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => SearchsController(), fenix: true);

    // // Get.put(() => FavoriteController(),permanent: true);
    Get.lazyPut(() => OrderController(), fenix: true);
    Get.lazyPut(() => SliderController(), fenix: true);
    // Get.lazyPut(() => MyMapController());
    // Get.lazyPut(() => OrderController(), fenix: true);
  }
}
