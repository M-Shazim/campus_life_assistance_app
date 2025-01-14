import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'dart:async';
import 'package:background_fetch/background_fetch.dart';

void backgroundTask(String taskId) async {
  // Perform your background task here
  await checkForDueAssignments();  // This is your function to check due assignments
  await checkForDueClasses();  // This is your function to check due classes

  // Call finish to let the background fetch system know the task is complete
  BackgroundFetch.finish(taskId);
}

void startBackgroundFetch() {
  // Configure the background fetch
  print("background fetch plugin running");

  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15, // Check every 15 minutes
      stopOnTerminate: false,   // Continue even if the app is terminated
      startOnBoot: true,        // Start the task when the device is rebooted
      enableHeadless: true,     // Enable headless mode for background execution
    ),
    backgroundTask,
  );
}

void startDueDateCheckTimer() {
  Timer.periodic(Duration(minutes: 1), (timer) {
    print("Check timer running");
    checkForDueAssignments();
    checkForDueClasses(); // Check for due assignments every 15 minutes
  });
}

Future<void> checkForDueAssignments() async {
  final now = DateTime.now();
  final dueDateThreshold = now.add(Duration(hours: 1)); // Set a threshold for 1 hour before the due date

  final assignments = await FirebaseFirestore.instance.collection('assignments').get();

  for (var assignment in assignments.docs) {
    final dueDate = (assignment['duedate'] as Timestamp).toDate();
    print("Check for overdueAssignments running before notification");

    // If the due date is near (e.g., within the next hour)
    if (dueDate.isBefore(dueDateThreshold)) {
      print("Check for overdueAssignments running after notification");

      final title = assignment['title'];
      showNotification('Assignment Due Soon', '$title is due soon!');
    }
  }
}

Future<void> checkForDueClasses() async {
  final now = DateTime.now();
  final dueDateThreshold = now.add(Duration(hours: 1)); // Set a threshold for 1 hour before the due date

  final classes = await FirebaseFirestore.instance.collection('classes').get();

  for (var item in classes.docs) {
    final dueDate = (item['time'] as Timestamp).toDate();

    // If the due date is near (e.g., within the next hour)
    if (dueDate.isBefore(dueDateThreshold)) {
      final className = item['subject'];
      final room = item['room'];
      showNotification('Class of $className Starts Soon', 'In Room: $room!');
    }
  }
}


FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  const initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher'); // Replace with your app icon
  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(String title, String body) async {
  const androidDetails = AndroidNotificationDetails(
    'channel_id', // A unique channel ID
    'Channel Name',
    channelDescription: 'Your channel description',
    importance: Importance.high,
    priority: Priority.high,
  );

  const notificationDetails = NotificationDetails(android: androidDetails);

  // Construct a modified message based on optional parameters

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    title,
    body,
    notificationDetails,
    payload: 'notification_payload',
  );
}

void listenForNewAssignments() {
  FirebaseFirestore.instance.collection('assignments').snapshots().listen((snapshot) {
    for (var doc in snapshot.docChanges) {
      if (doc.type == DocumentChangeType.added) {
        // A new assignment is added
        final assignment = doc.doc.data();
        final title = assignment?['title'] ?? 'No title';
        final description = assignment?['description'] ?? 'No description';

        // Show a notification for the new assignment
        showNotification('New Assignment Added', '$title: $description');
      }
    }
  });
}

void listenForNewClasses() {
  FirebaseFirestore.instance.collection('classes').snapshots().listen((snapshot) {
    for (var doc in snapshot.docChanges) {
      if (doc.type == DocumentChangeType.added) {
        // A new class is added
        final classes = doc.doc.data();
        final subject = classes?['subject'] ?? 'No subject';
        final room = classes?['room'] ?? 'No room';

        final day = classes?['day'] ?? 'No day';

        // Show a notification for the new assignment
        showNotification('New Class Added', '$subject: $room: $day');
      }
    }
  });
}

void listenForNewFeedback() {
  FirebaseFirestore.instance.collection('feedback').snapshots().listen((snapshot) {
    for (var doc in snapshot.docChanges) {
      if (doc.type == DocumentChangeType.added) {
        // A new feedback is added
        final feedback = doc.doc.data();
        final about = feedback?['about'] ?? 'No about';

        // Show a notification for the new assignment
        showNotification('New feedback Added: ', '$about');
      }
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  try {
    await initFirebase();
    await FlutterFlowTheme.initialize();
    await initializeNotifications();

    // Start background services
    startDueDateCheckTimer();
    startBackgroundFetch();
    listenForNewAssignments();

    runApp(MyApp());
  } catch (e, stackTrace) {
    print('Error during app initialization: $e');
    print('Stack trace: $stackTrace');
  }

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = campusLifeAppFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'campus-life-app',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
