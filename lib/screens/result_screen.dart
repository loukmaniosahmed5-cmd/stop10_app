import 'package:flutter/material.dart';
import '../main.dart';
import 'home_screen.dart';
import 'game_screen.dart';

class ResultScreen extends StatelessWidget {
  final double temps;
  const ResultScreen({super.key, required this.temps});

  ({String label, String emoji, Color color}) get _appreciation {
    final ecart = (temps - 10.0).abs();
    if (ecart < 0.005) return (label: 'Parfait', emoji: '🏆', color: AppColors.gold);
    if (ecart <= 0.01) return (label: 'Incroyable', emoji: '🔥', color: AppColors.pink);
    if (ecart <= 0.05) return (label: 'Excellent', emoji: '⭐', color: AppColors.blue);
    if (ecart <= 0.20) return (label: 'Bien', emoji: '👍', color: Colors.white70);
    return (label: 'Raté', emoji: '😅', color: Colors.white38);
  }

  @override
  Widget build(BuildContext context) {
    final ecartSigne = temps - 10.0;
    final appr = _appreciation;
    final signe = ecartSigne >= 0 ? '+' : '';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                '🎯 RÉSULTAT',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1),
              ),
              const SizedBox(height: 28),
              Text(
                '${temps.toStringAsFixed(2).replaceAll('.', ',')} s',
                style: const TextStyle(color: Colors.white, fontSize: 56, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Text(
                'Écart : $signe${ecartSigne.toStringAsFixed(2).replaceAll('.', ',')} s',
                style: const TextStyle(color: Colors.white54, fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                decoration: BoxDecoration(
                  color: appr.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: appr.color.withOpacity(0.5)),
                ),
                child: Text(
                  '${appr.emoji} ${appr.label} !',
                  style: TextStyle(color: appr.color, fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const GameScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    elevation: 8,
                    shadowColor: AppColors.red.withOpacity(0.5),
                    textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 19, letterSpacing: 1.5),
                  ),
                  child: const Text('REJOUER'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                ),
                child: const Text("Retour à l'accueil", style: TextStyle(color: Colors.white38, fontSize: 13)),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
