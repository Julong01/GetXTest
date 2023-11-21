import 'package:auction/router.dart';
import 'package:auction/view/sreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await ScreenUtil.ensureScreenSize();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    getPages: AppPages.pages,
    builder: (context, child) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: ScreenUtilInit(
            useInheritedMediaQuery: true,
            designSize: const Size(360, 780),
            // designSize: MediaQuery.of(context).size,
            builder: (_, child) {
              if (child != null) {
                return ScaffoldMessenger(
                    child: Stack(
                  children: [
                    child,
                  ],
                ));
              } else {
                return const SizedBox();
              }
            },
            child: child,
          ));
    },
  ));
}
