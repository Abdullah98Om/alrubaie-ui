import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? id, name, location, phone, note;
  int? price, finalPrice;
  DateTime? createdDate;
  bool? stateDone;
  OrderModel(
      {required this.id,
      this.name,
      this.createdDate,
      this.finalPrice,
      this.location,
      this.phone,
      this.price,
      this.stateDone,
      this.note});

  OrderModel.fromjson(Map<String, dynamic> map) {
    Timestamp date = map["createdDate"] as Timestamp;

    id = map["id"];
    name = map["name"] ?? "";
    phone = map["phone"] ?? "";
    createdDate = date.toDate();
    finalPrice = map["finalPrice"] ?? 0;
    location = map["location"] ?? "";
    price = map["price"] ?? 0;
    stateDone = map["stateDone"] ?? false;
    note = map["note"] ?? "";
  }

  tojson() {
    return {
      "name": name,
      "phone": phone,
      "location": location,
      "price": price,
      "finalPrice": finalPrice,
      "stateDone": stateDone,
      "createdDate": Timestamp.fromDate(createdDate!),
      "note": note,
    };
  }
}
