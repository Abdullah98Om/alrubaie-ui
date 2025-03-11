import 'package:alrubaie/firebase_options.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utility/binding.dart';
import 'utility/constant.dart';
import 'utility/router/page_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// SharedPreferences? sharedPreferences;
// FirebaseMessaging messaging = FirebaseMessaging.instance;
// String? appMessagingToken = "";

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> initSupabase() async {
  await Supabase.initialize(url: SupaProjectURL, anonKey: SupaProjectKey);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([initFirebase(), initSupabase()]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top
    ]); // اظهار الشريط السفلي والعلوي

//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//   SystemUiOverlay.top
// ]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // التدوير
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(402, 874), // حجم التصميم الأصلي (حسب تصميمك)
      minTextAdapt: true, // يجعل النصوص متجاوبة
      splitScreenMode: true, // يدعم الشاشات الكبيرة مثل التابلت

      child: GetMaterialApp(
        // Locale('ar', 'SA')
        locale: const Locale('ar', 'SA'),
        debugShowCheckedModeBanner: false,
        initialBinding: MyBinding(),
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: fontAlmarai, // "Almarai" or "Roboto"
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: pageRoutes,
        initialRoute: '/',
      ),
    );
  }
}
