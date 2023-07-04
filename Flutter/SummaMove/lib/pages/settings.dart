import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(AppLocalizations.of(context).language),
              const LanguageDropdown(),
              const Divider(),
              Text(AppLocalizations.of(context).theme),
              const ThemeDropdown(),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  static List<String> languagesStr = <String>[
  "System", "NL", "EN"
  ];

  static List<Locale> languages = <Locale>[
    Locale(Intl.systemLocale), const Locale('NL'), const Locale('EN'),
  ];

  String dropdownValue = languagesStr.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.language),
      elevation: 5,
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          //  languages[languagesStr.indexOf(value)];
        });
      },
      items: languagesStr.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({super.key});

  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  static List<String> themeModesStr = <String>[
    "System", "Light", "Dark"
  ];

  static List<ThemeMode> themeModes = <ThemeMode>[
    ThemeMode.system, ThemeMode.light, ThemeMode.dark
  ];

  String dropdownValue = themeModesStr.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.brightness_4),
      elevation: 1,
      underline: Container(
        height: 2,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          // themeModes[themeModesStr.indexOf(value)];
        });
      },
      items: themeModesStr.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
