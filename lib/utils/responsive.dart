import 'package:flutter/material.dart';

/// Petit utilitaire pour adapter l'UI entre téléphone et tablette,
/// sans changer la structure des écrans.
///
/// - Sur téléphone : comportement identique à avant (échelle = 1).
/// - Sur tablette (plus petit côté >= 600dp) : le contenu est limité
///   à une largeur max et centré, et les textes/icônes sont
///   légèrement agrandis pour occuper l'espace de façon cohérente.
class Responsive {
  final BuildContext context;
  const Responsive(this.context);

  factory Responsive.of(BuildContext context) => Responsive(context);

  Size get _size => MediaQuery.of(context).size;

  /// Vrai si l'appareil est considéré comme une tablette.
  bool get isTablet => _size.shortestSide >= 600;

  /// Largeur max du bloc de contenu (boutons, textes, colonne principale)
  /// pour éviter qu'il s'étire sur toute la largeur d'un écran de tablette.
  double get maxContentWidth => isTablet ? 480 : double.infinity;

  /// Facteur d'échelle pour les tailles de police / icônes / éléments
  /// graphiques, plafonné pour rester raisonnable sur très grandes tablettes.
  double get scale {
    final shortest = _size.shortestSide;
    final factor = shortest / 390; // 390 ≈ largeur d'un téléphone de référence
    return factor.clamp(1.0, 1.35);
  }

  double font(double base) => base * scale;
  double icon(double base) => base * scale;

  /// Padding horizontal adapté : plus généreux sur tablette puisque le
  /// contenu est déjà limité en largeur par [maxContentWidth].
  double get horizontalPadding => isTablet ? 0 : 32;
}