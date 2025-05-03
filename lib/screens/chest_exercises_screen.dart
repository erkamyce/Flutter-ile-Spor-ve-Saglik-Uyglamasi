import 'package:flutter/material.dart';

class ChestExercisesScreen extends StatelessWidget {
  const ChestExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chestExercises = [
      {
        'title': 'Bench Press',
        'description': 'Barbell ile yapılan temel göğüs egzersizi.',
        'image': 'asset/bench.jpg',
        'howTo': 'Sırtınızı benche tam yaslayarak başlayın. Barı omuz genişliğinde kavrayın ve göğsünüze doğru indirin. Kontrollü şekilde yukarı itin.',
      },
      {
        'title': 'Push-up',
        'description': 'Vücut ağırlığıyla yapılan etkili göğüs çalışması.',
        'image': 'asset/pushup.jpg',
        'howTo': 'Ellerinizi omuz hizasında konumlandırın. Gövdenizi düz tutarak göğsünüz yere yaklaşana kadar inin, ardından yukarı itin.',
      },
      {
        'title': 'Incline Dumbbell Press',
        'description': 'Üst göğüs kaslarını hedefler.',
        'image': 'asset/incline.jpg',
        'howTo': 'Eğimli bir benche yaslanarak dumbbell’ları yukarı doğru itin. Kontrollü şekilde aşağıya indirin, tekrar yukarı itin.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Göğüs Egzersizleri"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chestExercises.length,
        itemBuilder: (context, index) {
          final item = chestExercises[index];
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          item['howTo'] ?? "Açıklama bulunamadı.",
                          style: const TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                          label: const Text("Kapat"),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(item['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black26,
                      Colors.black87,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['description']!,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
