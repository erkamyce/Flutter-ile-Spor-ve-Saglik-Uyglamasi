import 'package:flutter/material.dart';

class BackExercisesScreen extends StatelessWidget {
  const BackExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> backExercises = [
      {
        'title': 'Deadlift',
        'description': 'Sırt, bel ve bacakları çalıştıran temel hareket.',
        'image': 'asset/deadlift.jpg',
        'howTo': 'Ayaklar omuz genişliğinde açılır, bar yere yakın alınır ve sırt dik tutulur. Bar kaldırılırken kalça ve sırt aynı anda yükselir.',
      },
      {
        'title': 'Barbell Row',
        'description': 'Orta sırt bölgesine odaklanır.',
        'image': 'asset/barbellrow.jpg',
        'howTo': 'Vücut hafif öne eğilir. Bar karın hizasına çekilir, omuzlar geride tutulur ve sonra bar kontrollü şekilde indirilir.',
      },
      {
        'title': 'Lat Pulldown',
        'description': 'Kanat kaslarını hedefler.',
        'image': 'asset/latpulldown.jpg',
        'howTo': 'Bar geniş tutuşla kavranır ve göğüs hizasına çekilir. Dirsekler aşağı doğru hareket ederken sırt kasları sıkılır.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sırt Egzersizleri"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: backExercises.length,
        itemBuilder: (context, index) {
          final item = backExercises[index];
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
