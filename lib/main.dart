import 'package:dental_lab_app/core/constants/app_strings.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:dental_lab_app/logic/cubit/localization/local_cubit.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/rag/rag_cubit.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/logic/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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

      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => ProfileCubit(ApiServices())),
          BlocProvider(create: (context)=>EditProfileCubit(ApiServices())),
          BlocProvider(create: (context)=>UserOrdersCubit(ApiServices())),
          BlocProvider(create: (context) => RagCubit(ApiServices())),
          BlocProvider(create: (context) => LocalizationCubit()),
        ],

        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, themeState) {
            return MaterialApp(
              locale: context.watch<LocalizationCubit>().state,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
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
