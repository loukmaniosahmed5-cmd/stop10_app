import 'package:flutter/material.dart';
import '../main.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF071426), AppColors.background, Color(0xFF250C1E)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.blue.withOpacity(0.5), width: 2),
                  ),
                  child: const Icon(Icons.adjust_rounded, color: AppColors.red, size: 46),
                ),
                const SizedBox(height: 28),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.blue, AppColors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    'STOP 10',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: 2),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Arrête à exactement',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Text(
                  '10,00 s',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const Spacer(flex: 3),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GameScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      elevation: 8,
                      shadowColor: AppColors.red.withOpacity(0.5),
                      textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 19, letterSpacing: 1.5),
                    ),
                    child: const Text('START'),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
