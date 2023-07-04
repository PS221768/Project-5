import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../classes/ApiHandler.dart';
import '../../models/Exercise.dart';
import '../../pages/Exercises/exercisePage.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key, required this.title});
  final String title;

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  late List<Exercise>? exercises = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    exercises = (await ApiHandler().getExercises())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: exercises?.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      final languageCode = Intl.systemLocale.split('_')[0];
                      final description = 'description_$languageCode'; // stupid & lazy solution
                      return ExercisePage(
                          title: exercises![index].name, content: exercises![index][description]
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
                        constraints: const BoxConstraints(maxHeight: 50, maxWidth: 200),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: HSVColor.fromAHSV(1, ((index * 20) % 360), 0.7, 1).toColor(), width: 15)),
                        ),
                        child: Center(
                            child: Text(exercises![index].name,
                                style: Theme.of(context).textTheme.titleMedium)),
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
