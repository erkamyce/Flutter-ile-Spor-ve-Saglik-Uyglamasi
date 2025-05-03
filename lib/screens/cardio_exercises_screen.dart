import 'package:flutter/material.dart';

class CardioExercisesScreen extends StatelessWidget {
  const CardioExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardioExercises = [
      {
        'title': 'Jump Rope',
        'description': 'Tüm vücudu çalıştıran etkili kardiyo egzersizi.',
        'image': 'asset/jumprope.jpg',
        'howTo': 'Ayak uçlarında zıplayarak ip atlanır. Dönüş hızı ve sıklık kontrollü şekilde artırılabilir.',
      },
      {
        'title': 'Burpee',
        'description': 'Yoğun tempolu yağ yakımı için birebir.',
        'image': 'asset/burpee.jpg',
        'howTo': 'Ayakta başlanır, çömelip eller yere konur, ayaklar geriye atılır, şınav pozisyonu alınır, geri çekilip zıplanır.',
      },
      {
        'title': 'Mountain Climber',
        'description': 'Core ve kalp ritmini çalıştırır.',
        'image': 'asset/mountain.jpg',
        'howTo': 'Şınav pozisyonunda dizler sırayla göğse doğru çekilir. Tempolu ve kontrollü yapılmalıdır.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Kardiyo Egzersizleri"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cardioExercises.length,
        itemBuilder: (context, index) {
          final item = cardioExercises[index];
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
