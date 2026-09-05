import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitik/src/features/package/presentation/cubit/create_package_cubit.dart';
import 'package:window_manager/window_manager.dart';

import 'src/config/config.dart';
import 'src/config/config_enum.dart';
import 'src/core/route/app_routes.dart';
import 'src/core/theme/themes.dart';
import 'src/features/package/presentation/widget/regular_button_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.setEnvironment(Flavors.development);

  if (Platform.isMacOS) {
    await windowManager.ensureInitialized();

    const windowOptions = WindowOptions(
      minimumSize: Size(1100, 800),
      maximumSize: Size(1100, 800),
      size: Size(1100, 800),
      center: true,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => RegularButtonLoadingCubit()),
        BlocProvider(create: (_) => CreatePackageCubit()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDarkMode) {
        final theme = isDarkMode ? ThemeCubit.darkMode : ThemeCubit.lightMode;

        return SafeArea(
          child: MaterialApp.router(
            theme: theme,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
