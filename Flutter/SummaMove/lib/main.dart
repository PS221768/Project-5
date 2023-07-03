import 'package:flutter/material.dart';
  import 'package:flutter_localizations/flutter_localizations.dart';
  import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:summamove/classes/SettingsHandler.dart';

import 'package:summamove/pages/home.dart';
import 'package:summamove/pages/Exercises/exercisesPage.dart';
import 'package:summamove/pages/Achievements/achievementsPage.dart';
import 'package:summamove/pages/Account/accountPage.dart';
import 'package:summamove/pages/about.dart';
import 'package:summamove/pages/settings.dart';

class Destination {
  Destination(this.label, this.icon);
  String label;
  final Widget icon;
}

// Init
void main() {
  runApp(
    MaterialApp(
      title: 'SummaMove',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('nl'), // Dutch
      ],
      locale: SettingsHandler().getLanguage(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: SettingsHandler().getThemeMode(),
      home: ChangeNotifierProvider(
        create: (context) => SettingsHandler(),
        child: const App(),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int screenIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Destination> destinations = <Destination>[
      Destination(AppLocalizations.of(context).home, const Icon(Icons.home)),
      Destination(AppLocalizations.of(context).exercises, const Icon(Icons.fitness_center)),
      Destination(AppLocalizations.of(context).achievements, const Icon(Icons.emoji_events)),
      Destination(AppLocalizations.of(context).account, const Icon(Icons.account_circle_outlined)),
      Destination(AppLocalizations.of(context).about, const Icon(Icons.text_snippet_outlined)),
      Destination(AppLocalizations.of(context).settings, const Icon(Icons.settings)),
    ];

    List<Widget> pages = <Widget>[
      HomePage(title: AppLocalizations.of(context).home),
      ExercisesPage(title: AppLocalizations.of(context).exercises),
      AchievementsPage(title: AppLocalizations.of(context).achievements),
      AccountPage(title: AppLocalizations.of(context).account),
      AboutPage(title: AppLocalizations.of(context).about),
      SettingsPage(title: AppLocalizations.of(context).settings),
    ];

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        bottom: false,
        top: false,
        child: pages[screenIndex],
      ),
      appBar: AppBar(
        title: Text(
          destinations[screenIndex].label,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      drawer: NavigationDrawer(
        onDestinationSelected: handleScreenChanged,
        selectedIndex: screenIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'SummaMove',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ...destinations.map(
            (Destination destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label,
                    style: Theme.of(context).textTheme.bodyMedium),
                icon: destination.icon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
