import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:summamove/models/Achievement.dart';

import '../../classes/ApiHandler.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key, required this.title, required this.achievement});
  final String title;
  final Achievement achievement;

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.achievement.name);
    amountController = TextEditingController(text: widget.achievement.amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context, false),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                    style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                  controller: amountController,
                    style: Theme.of(context).textTheme.titleMedium),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50)),
                    onPressed: () async {
                      String? result = await ApiHandler().removeAchievement(widget.achievement.id);

                      if (result == "success") {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(AppLocalizations.of(context).removeAchievement),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50)),
                    onPressed: () async {
                      String name = nameController.text;
                      String amount = amountController.text;
                      String? result = await ApiHandler().updateAchievement(widget.achievement.id, name, amount);

                      if (result == "success") {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(AppLocalizations.of(context).editAchievement),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
