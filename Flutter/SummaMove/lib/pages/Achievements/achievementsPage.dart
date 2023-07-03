import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key, required this.title});
  final String title;

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  final List<String> entries = <String>["A", "B", "C", "D", "E"];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
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
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: HSVColor.fromAHSV(1, ((index * 20) % 360), 0.7, 1).toColor(), width: 15)),
                      ),
                      child: Center(child: Text(entries[index], style: Theme.of(context).textTheme.titleMedium)),
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
