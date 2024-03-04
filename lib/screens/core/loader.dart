import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    // await storage.clearStorage();
    final firstLaunch = await storage.isFirstLaunch();

    if (firstLaunch) {
      // varsayilan tema modunu oku sistemden
      final darkMode;
      if (ThemeMode.system == ThemeMode.light) {
        darkMode = false;
      } else {
        darkMode = true;
      }

      // varsayilan sistemdeki dili okumak kodlari
      final String defaultLocale =
          Platform.localeName; // Returns locale string in the form 'en_US'
      final langParts = defaultLocale.split("_");

      // tr_TR

      final supportedLanguages = ["en", "tr", "fr", "es"];
      final lang;
      if (supportedLanguages.contains(langParts[0].toLowerCase())) {
        // cihazda olan dili destekliyoruz
        lang = langParts[0].toLowerCase();
      } else {
        lang = "en";
      }

      await storage.setSettings(darkMode: darkMode, language: lang);
      // tanitima gonder
      // navigate to boarding screen
      GoRouter.of(context).replace("/boarding");
    } else {
      // ayarlari yukliyelim
      final settings = await storage.getSettings();
      // ana ekrana git
      // navigate to home screen
      GoRouter.of(context).replace("/home");
    }
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
