import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const Stop10App());
}
/// Palette reprise de l'icône : fond bleu-nuit très sombre, bordure
/// dégradée bleu → rose néon, rouge pour le viseur/l'aiguille.
class AppColors {
  static const background = Color(0xFF07070F);
  static const surface = Color(0xFF14131F);
  static const surfaceLight = Color(0xFF1D1B2C);
  static const blue = Color(0xFF3DC9F5);
  static const pink = Color(0xFFFF3D7F);
  static const red = Color(0xFFF7353E);
  static const gold = Color(0xFFFFC542);
}

class Stop10App extends StatelessWidget {
  const Stop10App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stop 10',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.pink,
          brightness: Brightness.dark,
          surface: AppColors.surface,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
      ),
      home: const SplashScreen(),
    );
  }
}
