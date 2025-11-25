import 'package:dental_lab_app/core/constants/app_strings.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_theme.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
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

      child: BlocProvider(
        create: (context) => ThemeCubit(),

        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.materialTypes,

              // THEME IS NOW CONTROLLED BY THE CUBIT
              theme: themeState,

              //all Avante routes
              initialRoute: Routes.initialRoute,
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
