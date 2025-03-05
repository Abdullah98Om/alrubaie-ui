import 'package:alrubaie/controller/cart_controller.dart';
import 'package:alrubaie/controller/home_controller.dart';
import 'package:alrubaie/model/item_model.dart';
import 'package:alrubaie/model/order_model.dart';
import 'package:alrubaie/servicies/order_services.dart';
import 'package:alrubaie/utility/converter.dart';
import 'package:alrubaie/utility/my_dialog.dart';
import 'package:alrubaie/utility/router/page_route.dart';
import 'package:alrubaie/view/widgets/my_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  CartController cartController = Get.find<CartController>();
  final HomeController _homeController = Get.find<HomeController>();
  final OrderServices _orderServices = OrderServices();
/////////////////////////////////////////////////////////////////
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController locationTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController noteTextEditingController =
      TextEditingController();

/////////////////////////////////////////////////////////////////
  @override
  void onInit() {
    super.onInit();
    getMyLocalOrders();
  }

  @override
  void dispose() {
    nameTextEditingController.dispose();
    locationTextEditingController.dispose();
    noteTextEditingController.dispose();
    phoneTextEditingController.dispose();
    super.dispose();
  }

  List<String> myLocalOrders = [];
  List<OrderModel> myOrders = [];
  OrderModel? selectedOrder;

  // get All my Orders  From SQL DB
  void getMyLocalOrders() {
    _orderServices.getMyLocalOrders().then((lis) {
      if (lis.isNotEmpty) {
        myLocalOrders = lis;
        getMyOrders();
      }
      update();
    });
  }

  bool getAllMyOrdersLoader = false;
  void getMyOrders() {
    getAllMyOrdersLoader = true;
    update();
    _orderServices.getMyOrdersDB(myLocalOrders).then((ls) {
      if (ls.isNotEmpty) {
        myOrders = ls;
      }
      getAllMyOrdersLoader = false;
      update();
    });
  }

  doneInformationOrder() {
    if (formkey.currentState != null) {
      if (formkey.currentState!.validate()) {
        final isNum = int.tryParse(phoneTextEditingController.text);
        if (nameTextEditingController.text != "" &&
            locationTextEditingController.text != "" &&
            phoneTextEditingController.text != "" &&
            isNum != null &&
            (phoneTextEditingController.text.length == 10 ||
                phoneTextEditingController.text.length == 11)) {
          Get.toNamed("/${MyPages.finalOrder}");
        }
      }
    }
  }

  bool sendLoader = false;
  sendFinalOrder() {
    if (nameTextEditingController.text != "" &&
        locationTextEditingController.text != "" &&
        phoneTextEditingController.text != "" &&
        cartController.allMyItemsCart.isNotEmpty &&
        cartController.getPriceCart() > 0) {
      myDilog(
          confirmf: () {
            Get.back();
            sendLoader = true;
            update();
            _orderServices
                .sendFinalOrder(
                    OrderModel(
                        id: "",
                        createdDate: DateTime.now(),
                        price: cartController.getPriceCart(),
                        name: nameTextEditingController.text,
                        location: locationTextEditingController.text,
                        phone: phoneTextEditingController.text,
                        note: noteTextEditingController.text,
                        finalPrice: 0,
                        stateDone: false),
                    cartController.allMyItemsCart)
                .then((done) {
              if (done) {
                cartController.clearCartForOrder();
                Get.back();
                Get.back();
                Get.back();
                mySnackBar(
                    title: "الطلب",
                    body: "تم أرسال طلبك بنجاح",
                    icon: Icons.done_all);
                getMyLocalOrders();
                // Get.offAllNamed("/${MyPages.indexPage}");
              }
              sendLoader = false;
              update();
            });
          },
          confirmText: "أرسال",
          title: "أتمام الطلب",
          middleText:
              "هل أنت متأكد من ارسال البيانات لأكمال طلبك بقيمة ( ${convertPrice(cartController.getPriceCart())} ) ؟");
    } else {
      mySnackBar(
          title: "معلومات الطلب",
          body: "تأكد من جميع بيانات الطلب",
          icon: Icons.shopping_cart);
    }
  }

  List<ItemOrderModel> items = [];
  showOrderDetaile(int index) {
    items = [];
    selectedOrder = myOrders[index];
    loadItems();

    Get.toNamed("/${MyPages.orderDetailes}");
  }

  bool itemsLoader = false;
  loadItems() {
    // print(_homeController.products);
    if (selectedOrder != null && _homeController.products.isNotEmpty) {
      itemsLoader = true;
      update();
      _orderServices
          .loadItems(selectedOrder!, _homeController.products)
          .then((lis) {
        if (lis.isNotEmpty) {
          items = lis;
        }
        itemsLoader = false;
        update();
      });
    } else {
      if (_homeController.products.isEmpty) {
        mySnackBar(title: "المنتجات", body: "جاري تحميل المنتجات");
      }
    }
  }

//////////////////////////////////////////////////////////
// clear my Orders
  deleteAllMyOrdersFromDB() async {
    myDilog(
        confirmf: () {
          Get.back();
          _orderServices.deleteAllMyOrdersFromDB().then((onValue) {
            if (onValue) {
              myLocalOrders = [];
              myOrders = [];
              selectedOrder = null;
              update();
            }
          });
        },
        confirmText: "حذف",
        title: "طلباتي !!",
        middleText: "هل انت متأكد من حذف جميع الطلبات ؟");
  }

  String getStateOrder(OrderModel order) {
    if (order.finalPrice == 0) {
      return "قيد الأنتظار";
    } else if (order.finalPrice! > 0 && order.stateDone!) {
      return "مكتمل";
    } else if (!order.stateDone!) {
      return "مرفوض";
    } else {
      return "غير معروف";
    }
  }
}
