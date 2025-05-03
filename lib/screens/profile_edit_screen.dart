import 'package:flutter/material.dart';
import '../services/local_storage_service.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final boyController = TextEditingController();
  final kiloController = TextEditingController();
  final yasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await LocalStorageService.getUserData();
    boyController.text = data['boy'].toString();
    kiloController.text = data['kilo'].toString();
    yasController.text = data['yas'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profili Düzenle"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildInputField(boyController, "Boy (cm)"),
            _buildInputField(kiloController, "Kilo (kg)"),
            _buildInputField(yasController, "Yaş"),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                final boy = double.tryParse(boyController.text) ?? 0;
                final kilo = double.tryParse(kiloController.text) ?? 0;
                final yas = int.tryParse(yasController.text) ?? 0;
                await LocalStorageService.updateUserData(boy: boy, kilo: kilo, yas: yas);
                if (!mounted) return;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save),
              label: const Text("Kaydet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
