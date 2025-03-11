import 'package:alrubaie/model/section_model.dart';
import 'package:alrubaie/servicies/product_services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';
import '../model/super_section_model.dart';
import '../utility/router/page_route.dart';

class HomeController extends GetxController {
  final advancedDrawerController = AdvancedDrawerController();

  final ProductServices _productServices = ProductServices();

  final List<String> listTitles = ["Al-Rubaie", "المنتجات"];

  @override
  void onInit() {
    getSections();
    super.onInit();
  }

  List<SuperSectionModel> superSections = [
    // SuperSectionModel(id: "-1", name: "الكل")
  ];
  List<SectionModel> sections = [];
  List<SectionModel> selectedListSections = [
    SectionModel(id: "-1", name: "الكل")
  ];
  SuperSectionModel? selectedSuperSection;
  SectionModel? selectedSection;
  ////////////////////////////////////////
  ProductModel? selectedProduct;
  List<ProductModel> products = [];
  List<ProductModel> selectedProducts = [];
  List<ProductModel> starProducts = [];
  bool sectionLoader = false;

  set changeSelectedProduct(ProductModel? product) {
    if (product != null) {
      selectedProduct = product;
      update();
    }
  }

//////////////////////////////////////////////////////////
  void changeSelectedSuperSection(int index) {
    selectedProducts = [];

    // if (index == 0) {
    //   selectedProducts.addAll(products);
    //   selectedSuperSection = superSections[index];
    //   // selectedSection = sections[0];
    //   // changeSelectedSection = 0;
    //   update();
    //   Get.toNamed("/${MyPages.products}");
    // } else {
    Get.toNamed("/${MyPages.productsOfSection}");
    if (superSections.length > index) {
      selectedSuperSection = superSections[index];

      changeSelectedSection(0);
      // for (var p in products) {
      //   if (p.section!.section!.id == selectedSuperSection!.id) {
      //     selectedProducts.add(p);
      //   }
      // }
      // update();
    }
    // }
  }

  void changeSelectedSection(int index) {
    selectedProducts = [];
    selectedListSections = [SectionModel(id: "-1", name: "الكل")];
    // selectedSection = sections[index];
    for (var s in sections) {
      if (s.section!.id == selectedSuperSection!.id) {
        selectedListSections.add(s);
      }
    }
    selectedSection = selectedListSections[index];
    if (index == 0) {
      // selectedListSections.addAll(sections);
      selectedSection = selectedListSections.first;
      for (var p in products) {
        if (p.section!.section!.id! == selectedSuperSection!.id) {
          selectedProducts.add(p);
        }
      }
      update();
      // selectedProducts.addAll(products);
    } else {
      for (var p in products) {
        if (p.section!.id == selectedSection!.id) {
          selectedProducts.add(p);
        }
      }
      update();
    }
  }

/////////////////////////////////////////////////////
  ///
  getSections() {
    sectionLoader = true;
    update();

    _productServices.getSections().then((lis) {
      if (lis[0].isNotEmpty && lis[1].isNotEmpty) {
        superSections.addAll(lis[0] as List<SuperSectionModel>);
        sections.addAll(lis[1] as List<SectionModel>);
        selectedSuperSection = superSections.first;
        selectedSection = sections.first;

        getAllProducts();
      }

      sectionLoader = false;
      update();
    });
  }

  bool productsLoader = false;
  getAllProducts() {
    productsLoader = true;
    update();
    _productServices.getProducts(sections).then((lis) {
      if (lis.isNotEmpty) {
        products.addAll(lis[0]);
        starProducts.addAll(lis[1]);
        // update();
      }
      productsLoader = false;
      update();
    });
  }
}
