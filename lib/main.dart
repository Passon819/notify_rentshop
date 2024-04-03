import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screen/dependent_multilevel_dropdown/multilevel_dropdown.dart';
import 'screen/messaging_screen/MyHomePage.dart';
import 'screen/change_language/MyHomePageLN.dart';
import 'screen/messaging_screen/NotificationsPage.dart';
import 'screen/email_otp/SendOtp.dart';

//ทดลองแจ้งเตือน ทดลองเปลี่ยนภาษา ทดลองemail_otp

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      //startLocale: Locale('th', 'TH'),
      path: 'assets/locales',
      fallbackLocale: Locale('th', 'TH'),
      supportedLocales: [Locale('en', 'US'), Locale('th', 'TH')],
      //saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/notifications': (context) => const NotificationsPage()},
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          const MultiDropdown(), //const MyHomePage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
