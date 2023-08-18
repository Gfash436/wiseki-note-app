import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:wiseki_note_app/src/splash_screen.dart';
import 'package:wiseki_note_app/src/utils/note%20preference/note_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotePreferences.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 860,
        minWidth: 430,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(430, name: MOBILE),
        ],
        // background: Container(color: const Color(0xFFF5F5F5)),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
