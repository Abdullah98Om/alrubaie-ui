import 'package:supabase_flutter/supabase_flutter.dart';

import '../utility/check_network.dart';

class CursalServices {
  String fileNameInDB = 'slider';
  final supabase = Supabase.instance.client;

  Future<List<String>> getSliderImgs() async {
    List<String> list = [];

    try {
      if (await testInternet()) {
        final files = await supabase.storage.from(fileNameInDB).list();
        for (var file in files) {
          list.add(supabase.storage.from(fileNameInDB).getPublicUrl(file.name));
        }

        return list;
      } else {
        return list;
      }
    } catch (e) {
      return list;
    }
  }
}
