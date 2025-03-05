import 'package:flutter/material.dart';
import '../utility/sqldb.dart';
import '../view/widgets/my_snack_bar.dart';

class CartServices {
  SqlDb sqlDb = SqlDb();

// get All items cart From SQL DB
  Future<List<Map<String, dynamic>>> getCart() async {
    List<Map<String, dynamic>> lis = [];
    try {
      final response = await sqlDb.readData("SELECT * from cart ");
      // print(response);
      for (var element in response) {
        lis.add({
          "productID": element["productID"],
          "count": element["count"] as int
        });
      }
      return lis;
    } catch (e) {
      // print(e);
      return lis;
    }
  }

// delete Favorite item From SQL DB
  removeItemFromDB(String id) async {
    try {
      await sqlDb.deleteData("DELETE FROM cart WHERE productID='$id'");
    } catch (e) {
      // print(e);
    }
  }

// delete all cart items
  Future<bool> deleteAllItemsCartFromDB() async {
    try {
      await sqlDb.deleteData(" DELETE FROM cart ");
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  // create new item in cart in SQL DB
  Future<bool> createNewItemCart(String id) async {
    try {
      if (!await cheakFoundItemCart(id)) {
        await sqlDb.insertData(
            " INSERT INTO cart (productID , count) VALUES('$id' , 1 );");
        mySnackBar(
            title: "أضافة",
            body: "تمت الأضافة الى السلة",
            icon: Icons.done_all_outlined);
        return true;
      } else {
        mySnackBar(
            title: "المنتج موجود بالسلة.", body: "", icon: Icons.warning_amber);
        return false;
      }
    } catch (e) {
      // print(e);
      mySnackBar(
          title: "خطأ",
          body: "حدثت مشكلة أثناء الأضافة للسلة.",
          icon: Icons.error_outline);
      return false;
    }
  }

// update item in cart in SQL DB
  updateItemCart(String id, int count) async {
    try {
      if (await cheakFoundItemCart(id)) {
        await sqlDb.insertData(
            " UPDATE  cart SET count=$count  WHERE productID='$id' ;");
      } else {
        mySnackBar(
            title: "انتبه",
            body: "المنتج غير موجود بالسلة.",
            icon: Icons.warning_amber);
      }
    } catch (e) {
      // print(e);
    }
  }

// check item in cart in SQL DB
  Future<bool> cheakFoundItemCart(String id) async {
    try {
      final lis =
          await sqlDb.readData(" Select * From cart  WHERE productID='$id' ;");
      if (lis.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
