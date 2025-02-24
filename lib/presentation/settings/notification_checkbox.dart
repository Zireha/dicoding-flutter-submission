import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/notification/checkbox_provider.dart';

import '../../provider/notification/local_notification_provider.dart';

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
        return Consumer<CheckboxProvider>(
          builder: (context, checkboxProvider, child) {
            return Checkbox(
              checkColor: Colors.white,
              fillColor: WidgetStateProperty.resolveWith(getColor),
              value: checkboxProvider.isChecked,
              onChanged: (bool? value) async {
                if (value != null) {
                  await checkboxProvider.setCheckboxState(value);

                  if (value) {
                    notifProvider.scheduleDailyElevenAMNotification(
                        notifProvider.restaurants);
                  } else {
                    notifProvider.cancelNotif(notifProvider.notifId);
                  }
                }
              },
            );
          },
        );
      },
    );
  }
}
