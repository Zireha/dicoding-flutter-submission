import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/response/list_response.dart';
import 'package:restaurant_app/provider/notification/local_notification_provider.dart';
import 'package:restaurant_app/provider/theme/theme_mode_provider.dart';
import 'package:fluttertoast/fluttertoast.dart' as Toast;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> _requestPermission() async {
      context.read<LocalNotificationProvider>().requestPermission();
    }

    Future<void> _showNotif() async {
      context.read<LocalNotificationProvider>().showNotification();
    }

    Future<void> _scheduleDailyElevenAMNotification(name) async {
      context.read<LocalNotificationProvider>()
          .scheduleDailyElevenAMNotification(name);
    }

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          title: Text("Pengaturan",
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600, color: Colors.white)),
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 24.0),
              child: Consumer<LocalNotificationProvider>(
                builder: (context, provider, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Mode Gelap",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                          ),
                          const DarkModeSwitch()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Beri Notifikasi Setiap Jam 10 Pagi",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                          ),
                          const NotificationCheckbox(),
                        ],
                      ),
                      Text("Permission: ${provider.permission}"),
                      const SizedBox(height: 4,),
                      ElevatedButton(onPressed: () async {
                        await _showNotif();
                      }, child: const Text("Show Notif"), style: style,)
                    ],
                  );
                },
              ),
            )));
  }
}

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

class NotificationCheckbox extends StatefulWidget {
  const NotificationCheckbox({super.key});

  @override
  State<NotificationCheckbox> createState() => _NotificationCheckboxState();
}

class _NotificationCheckboxState extends State<NotificationCheckbox> {
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {

    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.brown;
    }

    return Consumer<LocalNotificationProvider>(
      builder: (context, notifProvider, child) {
        return Checkbox(
          checkColor: Colors.white,
          fillColor: WidgetStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });

            if (isChecked) {
              notifProvider.scheduleDailyElevenAMNotification(notifProvider.restaurants);
            } else {
              notifProvider.cancelNotif(notifProvider.notifId);
            }
          },
        );
      },
    );
  }
}
