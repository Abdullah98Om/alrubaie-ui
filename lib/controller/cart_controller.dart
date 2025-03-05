import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/model/item_model.dart';
import 'package:alrubaie/utility/my_dialog.dart';
import 'package:alrubaie/view/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/item_model.dart';
import '../model/product_model.dart';
import '../servicies/card_services.dart';

class CartController extends GetxController {
  final CartServices _cartServices = CartServices();

  final HomeController _homeController = Get.find<HomeController>();

  @override
  void onInit() {
    allProducts = _homeController.products;
    getCart();
    super.onInit();
  }

  List<Map<String, dynamic>> allItemsCart = [];
  List<ItemModel> allMyItemsCart = [];
  List<ProductModel> allProducts = [];

// check product exist in Cart or no
  int checkProductInCart(ProductModel product) {
    int index = -1;
    for (int i = 0; i < allMyItemsCart.length; i++) {
      if (allMyItemsCart[i].product!.id == product.id) {
        index = i;
        break;
      }
    }
    return index;
  }

// All items Cart (productID , count)
  void getCart() {
    _cartServices.getCart().then((lis) {
      if (lis.isNotEmpty) {
        allItemsCart = lis.reversed.toList();
        getMyCart();
        update();
      }
    });
  }

// All items Cart (Product Model , count)
  void getMyCart() {
    allMyItemsCart = [];
    for (var f in allItemsCart) {
      for (var element in allProducts) {
        if (f["productID"] == element.id) {
          allMyItemsCart.add(ItemModel(product: element, count: f["count"]));
          // allMyItemsCart.add({"product": element, "count": f["count"]});
          break;
        }
      }
    }
    update();
  }

// create new item (add to sqlite DB)
  void createNewItemCart(String productID) {
    _cartServices.createNewItemCart(productID).then((onValue) {
      if (onValue) {
        getCart();
      }
    });
  }

  void updateItemCart(int index, bool increment) {
    if (increment) {
      allMyItemsCart[index].count = allMyItemsCart[index].count! + 1;
      _cartServices.updateItemCart(
          allMyItemsCart[index].product!.id!, allMyItemsCart[index].count!);
      update();
    } else {
      if (allMyItemsCart[index].count! > 1) {
        allMyItemsCart[index].count = allMyItemsCart[index].count! - 1;
        _cartServices.updateItemCart(
            allMyItemsCart[index].product!.id!, allMyItemsCart[index].count!);
        update();
      } else {
        // delete
        myDilog(
            confirmf: () {
              Get.back();
              _cartServices
                  .removeItemFromDB(allMyItemsCart[index].product!.id!);
              allMyItemsCart.removeAt(index);
              update();
            },
            confirmText: "حذف",
            title: allMyItemsCart[index].product!.name!,
            middleText: "هل أنت متأكد من حذف العنصر ؟");
      }
    }
  }

// price for this item
  int getItemPrice(ProductModel p, int count) {
    return p.getPrice() * count;
  }

// totle price Cart
  int getPriceCart() {
    int sum = 0;
    for (var element in allMyItemsCart) {
      sum += ((element.product!.getPrice()) * element.count!);
    }

    return sum;
  }

// clear Cart
  void clearCart() {
    if (allMyItemsCart.isNotEmpty) {
      myDilog(
          confirmf: () {
            Get.back();
            _cartServices.deleteAllItemsCartFromDB().then((onValue) {
              if (onValue) {
                allItemsCart = [];
                allMyItemsCart = [];

                update();
              }
            });
          },
          confirmText: "حذف",
          title: "حذف السلة !!",
          middleText: "هل أنت متأكد من حذف جميع عناصر السلة");
    } else {
      mySnackBar(
          title: "السلة فارغة",
          body: "لا توجد عناصر داخل السلة !!",
          icon: Icons.shopping_cart);
    }
  }

  // clear Cart For Order
  void clearCartForOrder() {
    _cartServices.deleteAllItemsCartFromDB().then((onValue) {
      if (onValue) {
        allItemsCart = [];
        allMyItemsCart = [];
        update();
      }
    });
  }
}
