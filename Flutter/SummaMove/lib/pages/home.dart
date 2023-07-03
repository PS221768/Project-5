import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context).homeHeader, style: Theme.of(context).textTheme.headlineMedium),
                  const Divider(),
                  Image.network("https://i.postimg.cc/QxTMvcpV/logo-1861420-1280.webp", height: 300,)
                ]
            ),
          ),
        ),
      ),
    );
  }
}
