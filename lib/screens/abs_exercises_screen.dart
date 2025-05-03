import 'package:flutter/material.dart';

class AbsExercisesScreen extends StatelessWidget {
  const AbsExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> absExercises = [
      {
        'title': 'Crunch',
        'description': 'Üst karın kaslarını çalıştırır.',
        'image': 'asset/crunch.jpg',
        'howTo': 'Sırt üstü yat, dizler bükülü. Eller baş arkasında. Göğüs yukarı kalkarken bel yere temas etmeli.',
      },
      {
        'title': 'Plank',
        'description': 'Tüm core bölgesini çalıştırır.',
        'image': 'asset/plank.jpg',
        'howTo': 'Dirsek ve ayak parmaklarının üzerinde vücut düz tutulur. Karın sıkılır, kalça çok yükseltilmemeli.',
      },
      {
        'title': 'Leg Raise',
        'description': 'Alt karın bölgesine odaklanır.',
        'image': 'asset/legraise.jpg',
        'howTo': 'Sırt üstü yatılır. Ayaklar düz şekilde yukarı kaldırılır ve kontrollü olarak yere indirilir.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Karın Egzersizleri"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: absExercises.length,
        itemBuilder: (context, index) {
          final item = absExercises[index];
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
