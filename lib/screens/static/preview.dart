import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../bloc/client/client_cubit.dart';
import '../../core/localizations.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
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
          child: SizedBox.expand(
            child: ListView(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Theme.of(context).colorScheme.onBackground,
                  child: Center(
                    child: Text(
                      "Hello World",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Text(
                    AppLocalizations.of(context)
                        .getTranslate("connection-error"),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Hello World",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Subscribe"),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.person,
                        ),
                        onPressed: () {},
                      ),
                      IconButton.filled(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                      ),
                      IconButton.filledTonal(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                      ),
                      IconButton.outlined(
                        onPressed: () {},
                        icon: Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Logout"),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: () {},
                    child: Text("Logout"),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text("Logout"),
                  ),
                ),
                const Gap(10),
                const Text("Typography: "),
                Column(
                  children: [
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      "Hello World",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      "Hello World",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                    ),
                    Text(
                      "Hello World (ince)",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Hello World",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const Gap(20),
                const Gap(20),
                const Gap(20),
                const Gap(20),
                const Gap(20),
              ],
            ),
          ),
        ),
      );
    });
  }
}
