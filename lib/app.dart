import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Features/splash/presentation/manger/locale_cubit/locale_cubit.dart';
import 'Features/auth/fire_base_token/presentation/manger/token_cubit.dart';
import 'Features/bottom_nav/presentation/manger/cubit/bottom_nav_cubit.dart';
import 'Features/table/presentation/manager/cubit/pick_date_cubit.dart';
import 'core/locale/app_localizations_setup.dart';
import 'core/utils/functions/setup_service_locator.dart';
import 'core/utils/routes/app_routes.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<BottomNavCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<TokenCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<PickDateCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, localeState) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                locale: localeState.locale,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    fontFamily: "Cairo-Bold",
                    textTheme: const TextTheme(
                        titleSmall: TextStyle(fontSize: 10),
                        titleMedium: TextStyle(fontSize: 12))),

                // ThemeData.dark().copyWith(
                //   scaffoldBackgroundColor: kPrimaryColor,
                //   textTheme:
                //       GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
