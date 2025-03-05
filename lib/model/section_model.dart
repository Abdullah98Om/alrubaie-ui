import 'package:alrubaie/model/super_section_model.dart';

class SectionModel {
  String? name, id;
  SuperSectionModel? section;
  int? number;

  SectionModel({this.id, this.name, this.section, this.number});

  SectionModel.fromjson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    section = map["section"];
    number = map["number"];
  }

  tojson() {
    return {"name": name, "number": number, "section": section!.id};
  }
}
