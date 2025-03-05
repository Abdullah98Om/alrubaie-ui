import 'package:alrubaie/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'utility/binding.dart';
import 'utility/constant.dart';
import 'utility/router/page_route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: "https://jgdsvfbbazqpzzessvit.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpnZHN2ZmJiYXpxcHp6ZXNzdml0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA3NTE2NzQsImV4cCI6MjA1NjMyNzY3NH0.RkHegk6oS6sBwTu02y6N8isQVd1HbZLYhKxcQwa6IsA",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

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
