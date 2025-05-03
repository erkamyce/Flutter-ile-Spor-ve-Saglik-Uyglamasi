import 'package:flutter/material.dart';
import 'dailyplan_screen.dart';
import 'category_screen.dart'; // ← doğru dosya adı
import 'goalbased_screen.dart';

class ExercisePlanScreen extends StatelessWidget {
  const ExercisePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Spor Programı"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          bottom: const TabBar(
            indicatorColor: Colors.greenAccent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            tabs: [
              Tab(text: "Günlük"),
              Tab(text: "Kas Grubu"),
              Tab(text: "Hedef"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DailyPlanScreen(),
            CategoryScreen(), // ← doğru widget
            GoalBasedScreen(),
          ],
        ),
      ),
    );
  }
}
