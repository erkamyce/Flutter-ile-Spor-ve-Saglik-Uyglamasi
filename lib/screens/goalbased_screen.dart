import 'package:flutter/material.dart';

class GoalBasedScreen extends StatelessWidget {
  const GoalBasedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final goals = [
      {"title": "Kilo Almak", "program": "Ağırlık çalışmaları, kısa kardiyo"},
      {"title": "Kilo Vermek", "program": "HIT, uzun kardiyo, düşük ağırlık"},
      {"title": "Kilo Korumak", "program": "Full-body antrenmanlar"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            title: Text(goal['title']!, style: const TextStyle(color: Colors.white)),
            subtitle: Text(goal['program']!, style: const TextStyle(color: Colors.white70)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
            onTap: () {
              switch (goal['title']) {
                case "Kilo Almak":
                  Navigator.pushNamed(context, '/gain_weight_plan');
                  break;
                case "Kilo Vermek":
                  Navigator.pushNamed(context, '/lose_weight_plan');
                  break;
                case "Kilo Korumak":
                  Navigator.pushNamed(context, '/maintain_weight_plan');
                  break;
              }
            },
          ),
        );
      },
    );
  }
}
