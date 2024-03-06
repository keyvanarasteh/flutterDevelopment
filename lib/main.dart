import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/client/client_cubit.dart';
import 'core/routes.dart';
import 'core/themes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
