import 'package:flutter/material.dart';
import 'package:wiseki_note_app/src/constants/app_text_style/source_serif.dart';
import 'package:wiseki_note_app/src/constants/colors.dart';
import 'package:wiseki_note_app/src/constants/routers.dart';
import 'package:wiseki_note_app/src/features/home_screen/presentation/widgets/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? initScreen;

  @override
  void initState() {
    navToHomeScreen();
    super.initState();
  }

  navToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 1), () {});

    // ignore: use_build_context_synchronously
    Future.delayed(const Duration(seconds: 3), () {
      PageNavigator(ctx: context).nextPageOnly(page: const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: Text(
            'Wiseki Note App',
            style: AppStyleSourceSerif4.kFontW7
                .copyWith(fontSize: 30, color: kPrimary),
          ),
        ),
      ),
    );
  }
}
