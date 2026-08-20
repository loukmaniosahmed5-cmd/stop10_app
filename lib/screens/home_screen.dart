import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/responsive.dart';
import '../widgets/banner_ad_widget.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
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
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: r.maxContentWidth),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      Container(
                        width: r.icon(90),
                        height: r.icon(90),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.blue.withOpacity(0.5), width: 2),
                        ),
                        child: Icon(Icons.adjust_rounded, color: AppColors.red, size: r.icon(46)),
                      ),
                      SizedBox(height: r.font(28)),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [AppColors.blue, AppColors.pink],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: Text(
                          'STOP 10',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: r.font(42), fontWeight: FontWeight.w900, letterSpacing: 2),
                        ),
                      ),
                      SizedBox(height: r.font(16)),
                      Text(
                        'Arrête à exactement',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: r.font(16), fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '10,00 s',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: r.font(22), fontWeight: FontWeight.w800),
                      ),
                      const Spacer(flex: 3),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GameScreen())),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: r.isTablet ? 24 : 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            elevation: 8,
                            shadowColor: AppColors.red.withOpacity(0.5),
                            textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: r.font(19), letterSpacing: 1.5),
                          ),
                          child: const Text('START'),
                        ),
                      ),
                      const Spacer(),
                      const BannerAdWidget(),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}