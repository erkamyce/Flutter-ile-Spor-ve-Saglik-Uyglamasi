import 'package:flutter/material.dart';
import '../widgets/goal_plan_checklist.dart';

class LoseWeightPlanScreen extends StatelessWidget {
  const LoseWeightPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plan = [
      "1. Gün: Kardiyo (30 dk koşu) + Plank + Mountain Climber",
      "2. Gün: Full Body HIIT (squat, push-up, burpee - 3 set)",
      "3. Gün: Aktif Dinlenme (yürüyüş, esneme)",
      "4. Gün: Bacak + Karın (lunge, crunch, leg raise)",
      "5. Gün: Kardiyo (30 dk ip atlama) + Plank",
      "6. Gün: Düşük Ağırlık + Yüksek Tekrar (kol, sırt)",
      "7. Gün: Dinlenme",
    ];

    return GoalPlanChecklist(title: "Kilo Verme Programı", planItems: plan);
  }
}
