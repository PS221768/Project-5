import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../classes/ApiHandler.dart';
import '../../main.dart';

class CreateAchievementPage extends StatefulWidget {
  const CreateAchievementPage({super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  State<CreateAchievementPage> createState() => _CreateAchievementPageState();
}

class _CreateAchievementPageState extends State<CreateAchievementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController finishController = TextEditingController();

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
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                    style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                  controller: amountController,
                    decoration: const InputDecoration(
                      hintText: "Amount",
                    ),
                    style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                    controller: startController,
                    decoration: const InputDecoration(
                      hintText: "Start",
                    ),
                    style: Theme.of(context).textTheme.titleMedium),
                TextFormField(
                    controller: finishController,
                    decoration: const InputDecoration(
                      hintText: "Finish",
                    ),
                    style: Theme.of(context).textTheme.titleMedium),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50)),
                    onPressed: () async {
                      String name = nameController.text;
                      int amount = int.parse(amountController.text);
                      String? result = await ApiHandler().createAchievement(name, amount, currentUser?.id, widget.id);

                      if (result == "success") {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(AppLocalizations.of(context).addAchievement),
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
