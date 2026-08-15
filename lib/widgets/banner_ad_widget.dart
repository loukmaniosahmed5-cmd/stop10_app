import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// ID de bannière fourni par Google pour les tests — ne jamais utiliser
/// le vrai ID pendant le développement (risque de suspension du compte AdMob).
const String _testBannerId = 'ca-app-pub-3940256099942544/6300978111';

/// Vrai ID de bloc d'annonces bannière, utilisé uniquement en mode release.
const String _prodBannerId = 'ca-app-pub-1441637375614589/3663127967';

String get _bannerAdUnitId => kDebugMode ? _testBannerId : _prodBannerId;

/// Bandeau publicitaire réutilisable. À placer en bas d'un écran.
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    final bannerAd = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _isLoaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );
    bannerAd.load();
    _bannerAd = bannerAd;
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      // Espace réservé pour éviter que le contenu "saute" quand la pub charge.
      return const SizedBox(height: 50);
    }
    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}