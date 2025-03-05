class SuperSectionModel {
  String? name, id, img;
  int? number;

  SuperSectionModel({this.id, this.name, this.number, this.img});

  SuperSectionModel.fromjson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    number = map["number"];
    img = map["img"];
  }

  tojson() {
    return {"name": name, "number": number, "img": img};
  }
}
