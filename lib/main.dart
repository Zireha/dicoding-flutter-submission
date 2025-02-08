import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/detail/detail_screen.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.homeScreen.name,
      routes: {
        NavigationRoute.homeScreen.name: (context) => const HomeScreen(),
        NavigationRoute.detailScreen.name: (context) => const DetailScreen(),
      },
    );
  }
}
