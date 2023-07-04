import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../classes/ApiHandler.dart';
import '../../main.dart';
import '../../pages/Account/loginPage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.title});
  final String title;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: currentUser != null
            ? const AccountWidget(title: 'Account')
            : LoginPage(
                title: AppLocalizations.of(context).login,
                loginSuccess: () {
                  setState(() {
                    // refresh
                  });
                },
              )
    );
  }
}

class AccountWidget extends StatelessWidget {
  final String title;
  const AccountWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Padding(padding: EdgeInsets.all(10)),
          Text("${AppLocalizations.of(context).welcome} ${currentUser?.name}",
              style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          Text("Email: ${currentUser?.email}",
              style: Theme.of(context).textTheme.titleSmall),
          Text(
              "${AppLocalizations.of(context).creationDate} ${currentUser?.createdAt}",
              style: Theme.of(context).textTheme.titleSmall),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
              onPressed: () async {
                  String? string = await ApiHandler().logout();
                    if (string == "success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).logoutSuccess),
                        ),
                      );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context).loginFailed),
                      ),
                    );
                  }
                },
              child: Text(AppLocalizations.of(context).logout),
            ),
          )
        ]),
      ),
    );
  }
}
