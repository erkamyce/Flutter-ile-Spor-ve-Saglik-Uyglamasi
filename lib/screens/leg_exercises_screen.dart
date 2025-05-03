import 'package:flutter/material.dart';

class LegExercisesScreen extends StatelessWidget {
  const LegExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> legExercises = [
      {
        'title': 'Squat',
        'description': 'Tüm bacak kaslarını çalıştıran temel egzersiz.',
        'image': 'asset/squat.jpg',
        'howTo': 'Ayaklar omuz genişliğinde açılır. Kalça geriye gönderilerek dizler 90 dereceye kadar kırılır, ardından başlangıç pozisyonuna dönülür.',
      },
      {
        'title': 'Lunge',
        'description': 'Ön bacak ve kalça için etkili bir harekettir.',
        'image': 'asset/lunge.jpg',
        'howTo': 'Bir adım öne atılır, ön diz 90 dereceye kadar bükülür. Dengeli şekilde tekrar başlangıca dönülür ve diğer bacakla tekrarlanır.',
      },
      {
        'title': 'Leg Press',
        'description': 'Makine ile yapılan güçlü bir egzersiz.',
        'image': 'asset/legpress.jpg',
        'howTo': 'Bacaklar 90 derece bükülü pozisyondan makineyi iterek bacaklar düzeltilir ve kontrollü şekilde geri çekilir.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bacak Egzersizleri"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: legExercises.length,
        itemBuilder: (context, index) {
          final item = legExercises[index];
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
