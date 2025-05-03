import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController boyController = TextEditingController();
  final TextEditingController kiloController = TextEditingController();
  final TextEditingController yasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            width: size.width > 600 ? 400 : double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Kendini Tanıt",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 24),

                // Boy (cm)
                TextField(
                  controller: boyController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Boy (cm, örnek: 175)",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Kilo
                TextField(
                  controller: kiloController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Kilo",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16),

                // Yaş
                TextField(
                  controller: yasController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Yaş",
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () async {
                    final double? boyCm = double.tryParse(boyController.text);
                    final double? kilo = double.tryParse(kiloController.text);
                    final int? yas = int.tryParse(yasController.text);

                    if (boyCm == null || kilo == null || yas == null || boyCm <= 0 || kilo <= 0 || yas <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Lütfen tüm bilgileri doğru ve eksiksiz girin")),
                      );
                      return;
                    }

                    final double boyMetre = boyCm / 100;

                    await LocalStorageService.updateUserData(
                      boy: boyMetre,
                      kilo: kilo,
                      yas: yas,
                    );

                    await LocalStorageService.setFirstLoginFalse();

                    if (!mounted) return;
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text("Devam Et"),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
