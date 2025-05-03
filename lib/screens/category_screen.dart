import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"name": "Göğüs", "icon": Icons.fitness_center},
      {"name": "Bacak", "icon": Icons.directions_run},
      {"name": "Kol", "icon": Icons.accessibility_new},
      {"name": "Sırt", "icon": Icons.self_improvement},
      {"name": "Karın", "icon": Icons.sports_mma},
      {"name": "Kardiyo", "icon": Icons.favorite},
    ];

    return GridView.builder(

      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kart yan yana
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final item = categories[index];
        return GestureDetector(
          onTap: () {
            switch (item['name']) {
              case "Göğüs":
                Navigator.pushNamed(context, '/chest_exercises');
                break;
              case "Kol":
                Navigator.pushNamed(context, '/arm_exercises');
                break;
              case "Bacak":
                Navigator.pushNamed(context, '/leg_exercises');
                break;
              case "Sırt":
                Navigator.pushNamed(context, '/back_exercises');
                break;
              case "Karın":
                Navigator.pushNamed(context, '/abs_exercises');
                break;
              case "Kardiyo":
                Navigator.pushNamed(context, '/cardio_exercises');
                break;
              default:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${item['name']} egzersizleri yakında!")),
                );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item['icon'] as IconData, color: Colors.greenAccent, size: 40),
                const SizedBox(height: 10),
                Text(
                  item['name'] as String,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
