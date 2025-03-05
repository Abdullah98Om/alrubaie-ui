import 'package:alrubaie/model/section_model.dart';

class ProductModel {
  String? id, name, img, description;
  int? price, discount, number;

  bool? star;

  SectionModel? section;

  ProductModel(
      {this.id,
      this.name,
      this.img,
      this.price,
      this.discount,
      this.section,
      this.description,
      this.star,
      this.number});

  ProductModel.fromjson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"] ?? "";
    img = map["img"];
    price = map["price"] ?? 0;
    discount = map["discount"] ?? 0;
    section = map["section"];
    description = map["description"] ?? "";
    star = map["star"] ?? false;
    number = map["number"];
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "name": name,
      "img": img,
      "price": price,
      "discount": discount,
      "section": section!.id,
      "description": description,
      "star": star,
      "number": number,
    };
  }

  int getPrice() {
    if (price != null) {
      if (discount! > 0) {
        return price! - discount!;
      } else {
        return price!;
      }
    } else {
      return 0;
    }
  }
}
