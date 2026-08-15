import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../widgets/banner_ad_widget.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  final Stopwatch _chrono = Stopwatch();
  bool _enCours = false;
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1400))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _start() {
    HapticFeedback.lightImpact();
    _chrono
      ..reset()
      ..start();
    setState(() => _enCours = true);
  }

  void _stop() {
    HapticFeedback.mediumImpact();
    _chrono.stop();
    final tempsMs = _chrono.elapsedMilliseconds;
    final tempsSec = ((tempsMs / 10).round()) / 100.0;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ResultScreen(temps: tempsSec)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              if (!_enCours) ...[
                const Text(
                  'PRÊT ?',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 1),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Appuie sur START, puis arrête\nle plus près possible de 10,00 s",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 14, height: 1.4),
                ),
              ] else
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    final scale = 1.0 + (_pulseController.value * 0.12);
                    final opacity = 0.35 + (_pulseController.value * 0.35);
                    return Transform.scale(
                      scale: scale,
                      child: Icon(Icons.adjust_rounded, color: AppColors.red.withOpacity(opacity), size: 90),
                    );
                  },
                ),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _enCours ? _stop : _start,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _enCours ? AppColors.blue : AppColors.red,
                    foregroundColor: _enCours ? Colors.black : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    elevation: 8,
                    shadowColor: (_enCours ? AppColors.blue : AppColors.red).withOpacity(0.5),
                    textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22, letterSpacing: 2),
                  ),
                  child: Text(_enCours ? 'STOP' : 'START'),
                ),
              ),
             const Spacer(),
              const BannerAdWidget(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}