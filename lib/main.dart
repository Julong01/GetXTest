import 'package:auction/data/custom_dio/dio_client.dart';
import 'package:auction/routers/router.dart';
import 'package:auction/routers/router_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox("name");
  await dotenv.load(fileName: ".env");
  await ScreenUtil.ensureScreenSize();
  CustomDio();
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
