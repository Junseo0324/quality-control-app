import 'package:flutter/material.dart';
import 'package:quality_control/core/di/di_setup.dart';
import 'package:quality_control/core/routing/app_router.dart';
import 'package:quality_control/core/ui/app_colors.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.creamBg,
      ),
    );
  }
}
