import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClientCubit(
            darkMode: false,
            language: "en",
            rtl: false,
          ),
        ),
      ],
      child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
        return MaterialApp.router(
          themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          routerConfig: routes,
        );
      }),
=======
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
>>>>>>> parent of acd7694 (read system language and themeMode, load and save that settings in loader)
=======
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
>>>>>>> parent of a9c3115 (latest codes)
    );
  }
}
