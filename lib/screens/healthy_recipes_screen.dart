import 'package:flutter/material.dart';

class HealthyRecipesScreen extends StatefulWidget {
  const HealthyRecipesScreen({super.key});

  @override
  State<HealthyRecipesScreen> createState() => _HealthyRecipesScreenState();
}

class _HealthyRecipesScreenState extends State<HealthyRecipesScreen> {
  bool kiloAlmak = false;
  bool kiloVermek = false;
  bool kiloKorumak = false;

  final List<Map<String, String>> allRecipes = [
    {
      'title': 'Salad',
      'image': 'asset/salad.jpg',
      'category': 'vermek',
      'description': '1 avuç marul, 1 domates, 1 salatalık, 1 tatlı kaşığı zeytinyağı, limon ve tuz ile sağlıklı bir yeşil salata hazırlayabilirsiniz.'
    },
    {
      'title': 'Smoothie',
      'image': 'asset/smoothie.jpg',
      'category': 'almak',
      'description': '1 muz, 1 su bardağı süt, 1 yemek kaşığı yulaf ve 1 tatlı kaşığı bal ile enerji verici bir smoothie hazırlayabilirsiniz.'
    },
    {
      'title': 'Pancake',
      'image': 'asset/pancake.jpg',
      'category': 'korumak',
      'description': '1 yumurta, 1 çay bardağı süt, 1 çay bardağı un, 1 çay kaşığı kabartma tozu ve 1 tatlı kaşığı zeytinyağı ile fit pancake yapabilirsiniz.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = allRecipes.where((recipe) {
      final category = recipe['category'];
      if (!kiloAlmak && !kiloVermek && !kiloKorumak) return true;
      return (kiloAlmak && category == 'almak') ||
          (kiloVermek && category == 'vermek') ||
          (kiloKorumak && category == 'korumak');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Tarifleri"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text("Kilo Vermek"),
                  selected: kiloVermek,
                  onSelected: (val) => setState(() => kiloVermek = val),
                  selectedColor: Colors.green,
                  labelStyle: TextStyle(
                    color: kiloVermek ? Colors.black : Colors.white70,
                  ),
                  backgroundColor: Colors.grey[800],
                ),
                FilterChip(
                  label: const Text("Kilo Almak"),
                  selected: kiloAlmak,
                  onSelected: (val) => setState(() => kiloAlmak = val),
                  selectedColor: Colors.blue,
                  labelStyle: TextStyle(
                    color: kiloAlmak ? Colors.black : Colors.white70,
                  ),
                  backgroundColor: Colors.grey[800],
                ),
                FilterChip(
                  label: const Text("Kilo Korumak"),
                  selected: kiloKorumak,
                  onSelected: (val) => setState(() => kiloKorumak = val),
                  selectedColor: Colors.orange,
                  labelStyle: TextStyle(
                    color: kiloKorumak ? Colors.black : Colors.white70,
                  ),
                  backgroundColor: Colors.grey[800],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: filteredRecipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return _buildRecipeCard(
                    title: recipe['title'] ?? '',
                    image: recipe['image'] ?? '',
                    description: recipe['description'] ?? 'Tarif bilgisi bulunamadı.',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecipeCard({required String title, required String image, required String description}) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) {
            return _buildRecipeDetailBottomSheet(title, image, description);
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white10, Colors.black87],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeDetailBottomSheet(String title, String image, String description) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 150, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
