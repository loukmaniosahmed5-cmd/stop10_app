# Stop 10

Arrête le chronomètre le plus précisément possible à 10,00 secondes. Aucun
compte, aucune connexion — fonctionne entièrement hors ligne.

## Les 3 écrans

1. **Accueil** — titre, "Arrête à exactement 10,00 s", bouton START
2. **Jeu** — START lance un vrai chronomètre en arrière-plan, mais **le
   temps exact n'est pas affiché pendant la partie** : seule une icône de
   viseur pulse à un rythme constant (purement décoratif, sans lien avec le
   temps réel écoulé), pour ne pas trahir la progression et garder le défi
   difficile. Le joueur appuie sur STOP au jugé.
3. **Résultat** — temps obtenu, écart signé (+/-), appréciation
   (🏆 Parfait / 🔥 Incroyable / ⭐ Excellent / 👍 Bien / 😅 Raté selon
   l'écart), bouton REJOUER

## Choix fait sur la progression cachée

Tu avais laissé cette idée en option ("tu pourrais même..."), je l'ai
retenue par défaut : rien n'affiche le temps réel pendant que le chrono
tourne, ce qui rend le jeu plus intéressant qu'un simple chrono à lire. Si
tu préfères finalement voir le temps défiler en direct comme dans ta
maquette initiale, dis-le-moi — c'est un changement simple dans
`lib/screens/game_screen.dart`.

## Lancer le projet

```
flutter pub get
flutter pub run flutter_launcher_icons
flutter pub run flutter_native_splash:create
flutter run
```

Si le dossier `android/` n'existe pas encore dans ton projet, lance
`flutter create .` avant `flutter pub get` pour le générer.
