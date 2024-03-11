import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/cart/cart_cubit.dart';
import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  late CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("home_title")),
          actions: [
            if (clientCubit.state.darkMode)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {
                      clientCubit.changeDarkMode(darkMode: false);
                    },
                    icon: Icon(Icons.sunny)),
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {
                      clientCubit.changeDarkMode(darkMode: true);
                    },
                    icon: Icon(Icons.nightlight)),
              ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                InkWell(
                    onTap: () => GoRouter.of(context).push("/ali"),
                    child: const Text("HomeScreen")),
                Text("Language: " + clientCubit.state.language),
                Text("DarkMode: " + clientCubit.state.darkMode.toString()),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "en"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "en");
                              },
                        child: Text("English")),
                    Gap(10),
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "tr"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "tr");
                              },
                        child: Text("Turkce")),
                  ],
                ),
                const Divider(),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/products");
                    },
                    child: Text(
                        AppLocalizations.of(context).getTranslate("products"))),
                SizedBox(height: 50),
                Text("LOVE U ALL"),
                Icon(Icons.favorite, size: 90, color: Colors.red),
                Text("Keyvan Arasteh."),
              ],
            ),
          ),
        ),
      );
    });
  }
}
