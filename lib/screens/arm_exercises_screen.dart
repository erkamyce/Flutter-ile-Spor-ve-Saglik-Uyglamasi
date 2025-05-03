import 'package:flutter/material.dart';

class ArmExercisesScreen extends StatelessWidget {
  const ArmExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> armExercises = [
      {
        'title': 'Biceps Curl',
        'description': 'Biceps kaslarını çalıştıran temel hareket.',
        'image': 'asset/biceps.jpg',
        'howTo': 'Dirseklerin sabit kalmasına dikkat ederek dumbbell’ları omzuna doğru kaldır ve yavaşça indir.',
      },
      {
        'title': 'Triceps Dips',
        'description': 'Arka kol kasları için etkili bir egzersiz.',
        'image': 'asset/triceps.jpg',
        'howTo': 'Ellerini bir sandalyeye koyup, vücudunu öne doğru indirip kaldırarak triceps kaslarını çalıştır.',
      },
      {
        'title': 'Hammer Curl',
        'description': 'Ön kol kaslarını da çalıştırır.',
        'image': 'asset/hammer.jpg',
        'howTo': 'Dumbbell’ları dik şekilde (avuç içleri birbirine bakacak) kaldır ve yavaşça indir.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Kol Egzersizleri"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // Yazıyı beyaz yapar
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: armExercises.length,
        itemBuilder: (context, index) {
          final item = armExercises[index];
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
                    colors: [Colors.black26, Colors.black87],
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
