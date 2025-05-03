import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../services/local_storage_service.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Genel arka plan koyu
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: LocalStorageService.getUserData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final data = snapshot.data!;
          final double boy = data['boy'];
          final double kilo = data['kilo'];
          final double bmi = (boy > 0) ? kilo / (boy * boy) : 0.0;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    const Text(
                      "Vücut Kitle İndeksi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 250,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 10,
                            maximum: 40,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: const AxisLineStyle(
                              color: Colors.white24,
                              thickness: 0.2,
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            ranges: <GaugeRange>[
                              GaugeRange(startValue: 10, endValue: 18.5, color: Colors.blue),
                              GaugeRange(startValue: 18.5, endValue: 25, color: Colors.green),
                              GaugeRange(startValue: 25, endValue: 30, color: Colors.orange),
                              GaugeRange(startValue: 30, endValue: 40, color: Colors.red),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: bmi,
                                needleColor: Colors.white,
                                knobStyle: const KnobStyle(color: Colors.white),
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Text(
                                  bmi.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                angle: 90,
                                positionFactor: 0.6,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Yemek Tarifleri Kartı
              _buildFeatureCard(
                context,
                title: "Yemek Tarifleri",
                image: "asset/tarif.jpg",
                onTap: () => Navigator.pushNamed(context, '/healthy_recipes'),
              ),

              // Spor Programı Kartı
              _buildFeatureCard(
                context,
                title: "Spor Programı",
                image: "asset/spor.jpg",
                onTap: () => Navigator.pushNamed(context, '/exercise_plan'),
              ),

              // Takvim Kartı
              _buildFeatureCard(
                context,
                title: "Takvim",
                image: "asset/takvim.jpg",
                onTap: () => Navigator.pushNamed(context, '/calendar'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title, required String image, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white10, Colors.black87],
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
