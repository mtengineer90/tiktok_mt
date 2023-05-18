import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/providers.dart';
import '../router.dart';
import '../utils/customized_screen_utils.dart';
import '../utils/strings.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      ref.read(privoderTimer.notifier).state++;
    });
    return MaterialApp.router(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sfProCustomized'),
      routerConfig: AppRouter.router,
      builder: (context, child) {
        CustomizedScreenUtils.screenHeight = MediaQuery.of(context).size.height;
        CustomizedScreenUtils.screenWidth = MediaQuery.of(context).size.width;
        double designHeight = 812;
        double designWidth =
        CustomizedScreenUtils.screenHeight / CustomizedScreenUtils.screenWidth < 1.6 ? 480.0 : 375.0;
        final designSize = Size(designWidth, designHeight);
        return ScreenUtilInit(
          designSize: designSize,
          builder: (context, _) {
            return child!;
          },
        );
      },
    );
  }
}
