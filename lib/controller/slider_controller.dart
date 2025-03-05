import 'package:get/get.dart';
import '../servicies/cursalServices.dart';

class SliderController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllCursal();
  }

  int selectedIndex = 0;
  final CursalServices _cursalServices = CursalServices();

  List<String> allCursal = [];
  bool allCursalLoader = false;

  getAllCursal() {
    allCursalLoader = true;
    update();
    _cursalServices.getSliderImgs().then((onValue) {
      if (onValue.isNotEmpty) {
        allCursal = onValue;
      }
      allCursalLoader = false;
      update();
    });
  }
}
