import 'package:flutter/material.dart';
import '../widgets/goal_plan_checklist.dart';

class DailyPlanScreen extends StatelessWidget {
  const DailyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dailyPlan = [
      "Isınma (5-10 dk yürüyüş, esneme)",
      "Göğüs: 3x Bench Press, 3x Push-up",
      "Bacak: 3x Squat, 3x Lunge",
      "Karın: 3x Crunch, 2x Plank (30 sn)",
      "Kol: 3x Dumbbell Curl, 3x Triceps Dip",
      "Kardiyo: 15 dk koşu veya ip atlama",
      "Esneme ve soğuma (5 dk)",
    ];

    return GoalPlanChecklist(
      title: "Günlük Antrenman Planı",
      planItems: dailyPlan,
    );
  }
}
