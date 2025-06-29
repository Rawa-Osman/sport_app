import 'package:flutter/material.dart';
import 'package:sport_app/core/di/di_config.dart';
import 'package:sport_app/core/network/dio_config.dart';
import 'package:sport_app/core/network/internet_checker.dart';
import 'package:sport_app/core/routes/go_router_config.dart';

void main() {
    configureDependencies();

  getIt<DioConfig>().init();
  getIt<InternetChecker>().init();
  getIt<GoRouterConfig>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
            title: 'Sport',
            debugShowCheckedModeBanner: false,
            routerConfig: getIt<GoRouterConfig>().router,
          );
  }
}

