# Steve-20- — démarrage

## Ce ZIP contient
- Un projet Godot 4 en 2D.
- Un menu, une création de profil locale et une connexion de démonstration.
- Une liste de 10 héros et leurs pouvoirs ultimes.
- Un prototype de progression : vagues simulées, tours, or, germes, rubis et sauvegarde locale.
- Un workflow GitHub Actions de vérification du projet.

## Limites importantes
Ceci est un **prototype de départ**, pas encore le jeu final. Les combats sont simulés par des boutons; il n'y a pas encore de vraie carte avec ennemis animés, d'illustrations intégrées, ni de comptes en ligne.
Le compte local `Steve` / `4444` est une commodité de test seulement. Ne l'utilise pas pour un service public : le mot de passe est faible et les privilèges sont accordés localement dans le prototype. Une vraie version en ligne doit vérifier les rôles administrateur sur un serveur et sécuriser l'authentification.
Les mots de passe de la démo ne sont pas utilisés pour une authentification distante. Ne saisis aucun mot de passe important.

## Ouvrir le projet
1. Installe Godot 4 sur un ordinateur ou utilise un environnement compatible.
2. Dans Godot, importe le dossier qui contient `project.godot`.
3. Lance la scène principale.
4. Le profil de démonstration est enregistré dans `user://profile.json`.

## Termux et GitHub
Les téléphones Android avec peu de mémoire ne sont pas idéaux pour compiler Godot. Utilise Termux pour décompresser et envoyer les sources vers GitHub, puis utilise GitHub Actions pour les vérifications. L'export APK Android nécessite une version configurée de Godot, ses modèles d'export Android et le SDK Android; ce ZIP n'est pas un APK.

## Prochaine version
1. Faire une vraie carte tower-defense et les ennemis qui suivent un chemin.
2. Ajouter les attaques, les projectiles, les boss et les compétences.
3. Remplacer les éléments de test par des illustrations originales.
4. Ajouter l'authentification distante et la synchronisation cloud.
5. Configurer l'export Android Godot et tester l'APK sur un appareil.
