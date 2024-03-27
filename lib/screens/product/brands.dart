import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/localizations.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SizedBox.expand(
              child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Markalar",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Markalar Bulunamadi..",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 8,
                  spacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("reload"),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("reload"),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("reload"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context).getTranslate("reload"),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                runSpacing: 8,
                spacing: 12,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton.outlined(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "Hello Dear Students",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Hello Dear Students",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Hello Dear Students",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Hello Dear Students",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Hello Students",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              Container(
                // width: 300,
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.surface,
                ])),
              ),
              const Gap(20),
            ],
          )),
        ));
  }
}
