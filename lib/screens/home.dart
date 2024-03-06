import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/client/client_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => GoRouter.of(context).push("/ali"),
                  child: const Text("HomeScreen")),
              Text("geceMode: " + clientCubit.state.darkMode.toString()),
              Text("language: " + clientCubit.state.language.toString()),
              const Gap(20),
              clientCubit.state.darkMode
                  ? IconButton(
                      onPressed: () {
                        clientCubit.setThemeMode(false);
                      },
                      icon: const Icon(Icons.sunny))
                  : IconButton(
                      onPressed: () {
                        clientCubit.setThemeMode(true);
                      },
                      icon: const Icon(Icons.nightlight)),
              ElevatedButton(
                  onPressed: () {
                    clientCubit.setThemeMode(true);
                  },
                  child: Text("Gece Modu")),
              const Gap(20),
              ElevatedButton(
                  onPressed: () {
                    clientCubit.setThemeMode(false);
                  },
                  child: Text("Gunduz Modu")),
            ],
          ),
        ),
      ),
    );
  }
}
