import 'package:alrubaie/model/item_model.dart';
import 'package:alrubaie/model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../utility/check_network.dart';
import '../utility/sqldb.dart';
import '../view/widgets/my_snack_bar.dart';

class OrderServices {
  SqlDb sqlDb = SqlDb();
  final CollectionReference _orderCollectionRef =
      FirebaseFirestore.instance.collection("order");
  final CollectionReference _itemCollectionRef =
      FirebaseFirestore.instance.collection("item");

  // get All my Orders  From SQL DB
  Future<List<String>> getMyLocalOrders() async {
    List<String> lis = [];
    try {
      final response = await sqlDb.readData("SELECT * from myOrder ");
      // print(response);
      for (var element in response) {
        lis.add(element["orderID"]);
      }
      return lis;
    } catch (e) {
      // print(e);
      return lis;
    }
  }

// send order to firebase
  Future<bool> sendFinalOrder(
      OrderModel order, List<ItemModel> allMyItemsCart) async {
    final orderDoc = _orderCollectionRef.doc();

    try {
      if (await testInternet()) {
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          transaction.set(orderDoc, order.tojson());

          for (ItemModel i in allMyItemsCart) {
            Map<String, dynamic> d =
                Map<String, dynamic>.from(i.tojson()); //  نسخ
            d["order"] = orderDoc.id;

            transaction.set(_itemCollectionRef.doc(), d);
          }
        });
        await saveMyOrder(orderDoc.id);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      // print(e);
      mySnackBar(
          title: "خطأ",
          body: "حدثت مشكلة أثناء أكمال الطلب.",
          icon: Icons.error_outline);
      return false;
    }
  }

// get all items for this order
  Future<List<ItemOrderModel>> loadItems(
      OrderModel order, List<ProductModel> products) async {
    List<ItemOrderModel> lis = [];
    try {
      if (await testInternet()) {
        final itemsDoc =
            await _itemCollectionRef.where("order", isEqualTo: order.id).get();

        if (itemsDoc.docs.isNotEmpty) {
          for (var i in itemsDoc.docs) {
            Map<String, dynamic> data = i.data() as Map<String, dynamic>;
            data["order"] = order;
            for (var pro in products) {
              if (pro.id == data["product"]) {
                data["product"] = pro;
                ItemOrderModel io = ItemOrderModel.fromjson(data)..id = i.id;

                lis.add(io);
                break;
              }
            }
          }
          return lis;
        } else {
          return lis;
        }
      } else {
        return lis;
      }
    } catch (e) {
      // print(e);

      return lis;
    }
  }

// save my order in device (sqlite db)
  Future<bool> saveMyOrder(String orderID) async {
    try {
      await sqlDb
          .insertData(" INSERT INTO myOrder (orderID) VALUES('$orderID');");

      return true;
    } catch (e) {
      mySnackBar(
          title: "خطأ",
          body: "حدثت مشكلة أثناء حفظ الطلب في الجهاز.",
          icon: Icons.error_outline);
      return false;
    }
  }

// get All my Orders  From Firebase DB
  Future<List<OrderModel>> getMyOrdersDB(List<String> lisOrds) async {
    List<OrderModel> lis = [];

    try {
      if (await testInternet()) {
        final orderDoc = await _orderCollectionRef
            .where(FieldPath.documentId, whereIn: lisOrds)
            .orderBy("createdDate", descending: true)
            .get();

        if (orderDoc.docs.isNotEmpty) {
          for (var ord in orderDoc.docs) {
            OrderModel o =
                OrderModel.fromjson(ord.data() as Map<String, dynamic>)
                  ..id = ord.id;

            lis.add(o);
          }
          return lis;
        } else {
          return lis;
        }
      } else {
        return lis;
      }
    } catch (e) {
      // print(e);

      return lis;
    }
  }

// clear my Orders
  Future<bool> deleteAllMyOrdersFromDB() async {
    try {
      await sqlDb.deleteData(" DELETE FROM myOrder ");
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
