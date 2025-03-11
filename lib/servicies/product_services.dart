import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';
import '../model/section_model.dart';
import '../model/super_section_model.dart';
import '../utility/check_network.dart';

class ProductServices {
  final CollectionReference _sectionCollectionRef =
      FirebaseFirestore.instance.collection("section");

  final CollectionReference _superSectionCollectionRef =
      FirebaseFirestore.instance.collection("super_section");

  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection("product");

  // get all sections from firebase DB
  Future<List<List>> getSections() async {
    List<SuperSectionModel> superList = [];
    List<SectionModel> list = [];
    try {
      if (await testInternet()) {
        final resoult = await Future.wait([
          _superSectionCollectionRef.orderBy("number").get(),
          _sectionCollectionRef.orderBy("number").get()
        ]);
        var superValue = resoult[0];
        var value = resoult[1];
        // await _sectionCollectionRef.get();
        if (superValue.docs.isNotEmpty) {
          for (var d in superValue.docs) {
            final data =
                SuperSectionModel.fromjson(d.data() as Map<String, dynamic>)
                  ..id = d.id;

            superList.add(data);
          }
          if (value.docs.isNotEmpty && superList.isNotEmpty) {
            for (var d in value.docs) {
              Map<String, dynamic> dd = d.data() as Map<String, dynamic>;
              for (var s in superList) {
                if (s.id == dd["section"]) {
                  dd["section"] = s;
                  final data = SectionModel.fromjson(dd)..id = d.id;

                  list.add(data);
                  break;
                }
              }
            }
          }
          return [superList, list];
        }

        return [superList, list];
      } else {
        return [superList, list];
      }
    } catch (e) {
      // print(e);
      return [superList, list];
    }
  }

  // get section from firebase DB XXXXX
  Future<SectionModel?> getSection(String sectionID) async {
    try {
      if (await testInternet()) {
        DocumentSnapshot response =
            await _sectionCollectionRef.doc(sectionID).get();

        if (response.exists) {
          // print(response);
          return SectionModel.fromjson(response.data() as Map<String, dynamic>)
            ..id = response.id;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

// get product from firebase DB
  Future<ProductModel?> getProduct(String productID) async {
    try {
      if (await testInternet()) {
        DocumentSnapshot response =
            await _productCollectionRef.doc(productID).get();

        if (response.exists) {
          // print(response);
          Map<String, dynamic> data = response.data() as Map<String, dynamic>;
          SectionModel? s = await getSection(data['section']);
          if (s != null) {
            data['section'] = s;
            return ProductModel.fromjson(data)..id = response.id;
          } else {
            return null;
          }
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

// get prodects for this section from firebase DB
  Future<List<List<ProductModel>>> getProducts(
      List<SectionModel> sections) async {
    List<ProductModel> list = [];
    List<ProductModel> listStar = [];
    try {
      if (await testInternet()) {
        var value = await _productCollectionRef.orderBy("number").get();

        if (value.docs.isNotEmpty) {
          for (var d in value.docs) {
            final f = d.data() as Map<String, dynamic>;
            for (var section in sections) {
              if (section.id == f["section"]) {
                f["section"] = section;
                final data = ProductModel.fromjson(f)..id = d.id;

                list.add(data);
                if (data.star!) {
                  listStar.add(data);
                }
                break;
              }
            }
          }
        }

        return [list, listStar];
      } else {
        return [list, listStar];
      }
    } catch (e) {
      return [list, listStar];
    }
  }
}
