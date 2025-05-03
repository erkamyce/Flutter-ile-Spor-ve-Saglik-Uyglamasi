import 'package:flutter/material.dart';

// Sayfa importlarını buraya ekle
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/healthy_recipes_screen.dart';
import 'screens/exercise_plan_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/chest_exercises_screen.dart';
import 'screens/arm_exercises_screen.dart';
import 'screens/back_exercises_screen.dart';
import 'screens/abs_exercises_screen.dart';
import 'screens/cardio_exercises_screen.dart';
import 'screens/leg_exercises_screen.dart';
import 'screens/gain_weight_plan_screen.dart';
import 'screens/lose_weight_plan_screen.dart';
import 'screens/maintain_weight_plan_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlıklı Yaşam Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit_profile': (context) => const ProfileEditScreen(),
        '/recipes': (context) => const HealthyRecipesScreen(),
        '/exercise_plan': (context) => const ExercisePlanScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/calendar': (context) => const CalendarScreen(),
        '/healthy_recipes': (context) => const HealthyRecipesScreen(),
        '/chest_exercises': (context) => const ChestExercisesScreen(),
        '/arm_exercises': (context) => const ArmExercisesScreen(),
        '/leg_exercises': (context) => const LegExercisesScreen(),
        '/back_exercises': (context) => const BackExercisesScreen(),
        '/abs_exercises': (context) => const AbsExercisesScreen(),
        '/cardio_exercises': (context) => const CardioExercisesScreen(),
        '/gain_weight_plan': (context) => const GainWeightPlanScreen(),
        '/lose_weight_plan': (context) => const LoseWeightPlanScreen(),
        '/maintain_weight_plan': (context) => const MaintainWeightPlanScreen(),
      },
    );
  }
}
