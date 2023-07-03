import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key, required this.title});
  final String title;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(AppLocalizations.of(context).aboutBody),
              const Divider(),
              const AboutListTile(
                icon: Icon(Icons.info),
                applicationIcon: FlutterLogo(),
                applicationName: "SummaMove App",
                applicationVersion: "1.0.0",
                applicationLegalese: '\u{a9} 2023 SummaMove',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
