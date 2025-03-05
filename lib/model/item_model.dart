import 'package:alrubaie/model/order_model.dart';
import 'package:alrubaie/model/product_model.dart';

class ItemModel {
  int? count;
  ProductModel? product;

  ItemModel({this.product, this.count});

  ItemModel.fromjson(Map<String, dynamic> map) {
    product = map["product"];
    count = map["count"];
  }

  tojson() {
    return {
      "product": product!.id,
      "count": count,
    };
  }

  int getPriceItem() {
    try {
      return product!.getPrice() * count!;
    } catch (ex) {
      return 0;
    }
  }
}

class ItemOrderModel extends ItemModel {
  OrderModel? order;
  String? id;

  ItemOrderModel({this.id, required this.order, super.count, super.product});

  ItemOrderModel.fromjson(Map<String, dynamic> map) : super.fromjson(map) {
    id = map["id"];
    order = map["order"];
  }

  @override
  tojson() {
    final json = super.tojson();
    json["order"] = order!.id;

    return json;
  }
}
