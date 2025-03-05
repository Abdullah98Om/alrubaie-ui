import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchsController extends GetxController {
  final HomeController _homeController = Get.find<HomeController>();

  final TextEditingController searchTextEditingController =
      TextEditingController();

  List<ProductModel> selectedProducts = [];
  search(String value) {
    selectedProducts = [];
    if (value != "") {
      for (var p in _homeController.products) {
        if (p.name!.contains(value)) {
          selectedProducts.add(p);
        }
      }
    }

    update();
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }
}
