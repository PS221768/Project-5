import 'package:flutter/material.dart';
import '../../classes/ApiHandler.dart';
import '../../main.dart';
import '../../models/Achievement.dart';
import '../../pages/Achievements/achievementPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key, required this.title});
  final String title;

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  late List<Achievement>? achievements = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    achievements = [];
    achievements = (await ApiHandler().getAchievementsByUser(currentUser?.id))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            getData();
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.refresh),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: achievements?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return AchievementPage(
                        title: achievements![index].name,
                        achievement: achievements![index],
                      );
                    }),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Theme.of(context).shadowColor,
                    elevation: 5,
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: HSVColor.fromAHSV(
                                          1, ((index * 20) % 360), 0.7, 1)
                                      .toColor(),
                                  width: 15)),
                        ),
                        child: Column(children: [
                          Text(achievements![index].name,
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              "${AppLocalizations.of(context).achievementAmount} ${achievements![index].amount}",
                              style: Theme.of(context).textTheme.titleSmall),
                          Text(
                              "${AppLocalizations.of(context).achievementStart} ${achievements![index].start}",
                              style: Theme.of(context).textTheme.titleSmall),
                          Text(
                              "${AppLocalizations.of(context).achievementFinish} ${achievements![index].finish}",
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
