import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:restaurant_app/utils/utils.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  final notifPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const initSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestSoundPermission: false,
      requestBadgePermission: false,
    );

    const initSettings = InitializationSettings(
        android: initSettingsAndroid, iOS: initSettingsDarwin);

    await notifPlugin.initialize(initSettings);
  }

  Future<bool> _isAndroidPermissionGranted() async {
    return await notifPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.areNotificationsEnabled() ??
        false;
  }

  Future<bool> _requestAndroidNotificationsPermission() async {
    return await notifPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission() ??
        false;
  }

  Future<bool?> requestPermission() async {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iOSImplementation =
          notifPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      return await iOSImplementation?.requestPermissions(
          alert: true, badge: true, sound: true);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      final notifEnabled = await _isAndroidPermissionGranted();
      if (!notifEnabled) {
        final requestNotifPermission =
            await _requestAndroidNotificationsPermission();
        return requestNotifPermission;
      }
      return notifEnabled;
    } else {
      return false;
    }
  }

  Future<void> configLocalTimezone() async {
    tz.initializeTimeZones();
    final String tzName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(tzName));
  }

  tz.TZDateTime _nextInstanceOfElevenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 11);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<bool> _requestExactAlarmPermission() async {
    return await notifPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestExactAlarmsPermission() ??
        false;
  }

  Future<void> scheduleDailyElevenAMNotification({
    required int id,
    required String restaurantName,
    String channelId = "2",
    String channelName = "Restaurant App",
  }) async {
    final androidPlatformSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    const iOSPlatformSpecifics = DarwinNotificationDetails();

    final notifDetails = NotificationDetails(
        android: androidPlatformSpecifics, iOS: iOSPlatformSpecifics);

    final dateTimeSchedule = _nextInstanceOfElevenAM();

    List<String> notifTitle = [
      "Restoran ini kayanya cocok deh buat makan siang kamu",
      "Ada tempat bagus nih buat temenin makan kamu",
      "Sudah cari resto buat makan siang belum? Coba yang ini deh"
    ];

    await notifPlugin.zonedSchedule(
        id,
        notifTitle[getRandomNumber(notifTitle.length)],
        restaurantName,
        dateTimeSchedule,
        notifDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time
    );
  }

  Future<void> cancelNotif(int id) async {
    await notifPlugin.cancel(id);
  }

  Future<void> showNotif({
    required int id,
    required String title,
    required String body,
    required String payload,
    String channelId = "1",
    String channelName = "Simple Notif",
  }) async {
    final androidChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName,
        importance: Importance.max, priority: Priority.high);

    const iOSPlatformSpecifics = DarwinNotificationDetails();
    final notifDetails = NotificationDetails(
        android: androidChannelSpecifics, iOS: iOSPlatformSpecifics);

    await notifPlugin.show(id, title, body, notifDetails, payload: payload);
  }
}
