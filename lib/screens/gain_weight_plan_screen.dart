import 'package:flutter/material.dart';
import '../widgets/goal_plan_checklist.dart';

class GainWeightPlanScreen extends StatelessWidget {
  const GainWeightPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plan = [
      "1. Gün: Göğüs + Triceps (Bench Press, Push-up)",
      "2. Gün: Sırt + Biceps (Barbell Row, Biceps Curl)",
      "3. Gün: Dinlenme veya Hafif Kardiyo",
      "4. Gün: Bacak (Squat, Leg Press)",
      "5. Gün: Omuz + Karın (Shoulder Press, Plank)",
      "6. Gün: Serbest Antrenman",
      "7. Gün: Dinlenme",
    ];

    return GoalPlanChecklist(title: "Kilo Alma Programı", planItems: plan);
  }
}
