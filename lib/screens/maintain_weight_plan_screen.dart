import 'package:flutter/material.dart';
import '../widgets/goal_plan_checklist.dart';

class MaintainWeightPlanScreen extends StatelessWidget {
  const MaintainWeightPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plan = [
      "1. Gün: Full Body (squat, push-up, plank)",
      "2. Gün: Hafif Kardiyo (30 dk yürüyüş)",
      "3. Gün: Karın + Esneme (crunch, plank, stretching)",
      "4. Gün: Üst Vücut (bench press, dumbbell row)",
      "5. Gün: Kardiyo + Mobilite (ip atlama, dinamik esneme)",
      "6. Gün: Serbest (pilates, yoga veya yürüyüş)",
      "7. Gün: Dinlenme",
    ];

    return GoalPlanChecklist(title: "Kilo Korumak Programı", planItems: plan);
  }
}
