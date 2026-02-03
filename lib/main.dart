import 'package:flutter/material.dart';
import 'package:syniq/Core/themes/app_theme.dart';
import 'package:syniq/Routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Syniq',

      // 👇 GoRouter config
      routerConfig: AppRouter.router,

      theme: AppTheme.lightTheme,
    );
  }
}
