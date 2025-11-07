import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const AvanteApp());
}

class AvanteApp extends StatelessWidget {
  const AvanteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.materialTypes,
        //Avante theme
        theme: AppTheme.theme,

        //all Avante routes
        initialRoute: Routes.initialRoute,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
