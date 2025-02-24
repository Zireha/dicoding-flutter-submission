import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/presentation/detail/detail_screen.dart';
import 'package:restaurant_app/presentation/favorites/favorite_screen.dart';
import 'package:restaurant_app/presentation/home/home_screen.dart';
import 'package:restaurant_app/presentation/navbar/navbar_screen.dart';
import 'package:restaurant_app/presentation/settings/settings_screen.dart';
import 'package:restaurant_app/provider/detail/detail_provider.dart';
import 'package:restaurant_app/provider/home/home_list_provider.dart';
import 'package:restaurant_app/provider/main/index_nav_provider.dart';
import 'package:restaurant_app/provider/navbar/bottom_navbar_provider.dart';
import 'package:restaurant_app/provider/notification/checkbox_provider.dart';
import 'package:restaurant_app/provider/notification/local_notification_provider.dart';
import 'package:restaurant_app/provider/favorite/favorite_provider.dart';
import 'package:restaurant_app/provider/theme/theme_mode_provider.dart';
import 'package:restaurant_app/static/navigation_route.dart';
import 'package:restaurant_app/style/theme/app_theme.dart';
import 'data/notification/local_notification_service.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckboxProvider(),
        ),
        Provider(
          create: (context) => LocalNotificationService()
            ..init()
            ..configLocalTimezone(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalNotificationProvider(
            context.read<LocalNotificationService>(),
          )..requestPermission(),
        ),
        Provider(
          create: (context) => ApiService(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeListProvider(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider<BottomNavProvider>(
            create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (context) => ThemeModeProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          initialRoute: NavigationRoute.navbarScreen.name,
          routes: {
            NavigationRoute.homeScreen.name: (context) => const HomeScreen(),
            NavigationRoute.detailScreen.name: (context) => DetailScreen(
                  id: ModalRoute.of(context)?.settings.arguments as String,
                ),
            NavigationRoute.favoriteScreen.name: (context) =>
                const FavoriteScreen(),
            NavigationRoute.navbarScreen.name: (context) =>
                const NavbarScreen(),
            NavigationRoute.settingScreen.name: (context) =>
                const SettingsScreen(),
          },
        );
      },
    );
  }
}
