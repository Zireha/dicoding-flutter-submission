import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/notification/local_notification_provider.dart';

import 'dark_mode_switch.dart';
import 'notification_checkbox.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
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
                            "Beri Notifikasi Setiap Jam 11 Siang",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
                          ),
                          const NotificationCheckbox(),
                        ],
                      ),
                      //TODO: Delete this before submitting
                      Text("Permission: ${provider.permission}"),
                      const SizedBox(height: 4,),
                    ],
                  );
                },
              ),
            )));
  }
}
