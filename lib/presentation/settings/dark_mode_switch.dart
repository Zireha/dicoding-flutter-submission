import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme/theme_mode_provider.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeProvider>(
      builder: (context, themeProvider, child) {
        return Switch(
          value: themeProvider.isDarkMode,
          activeColor: Colors.brown[700],
          onChanged: (bool value) {
            themeProvider.toggleDarkMode(value);
          },
        );
      },
    );
  }
}