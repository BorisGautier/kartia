# KartIA

<p align="center">
  <img src="assets/images/logo.png" alt="KartIA Logo" width="200"/>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.29.3-blue.svg" alt="Flutter Version"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT"></a>
  <a href="https://firebase.google.com"><img src="https://img.shields.io/badge/Firebase-Enabled-orange" alt="Firebase"></a>
  <a href="https://www.mapbox.com"><img src="https://img.shields.io/badge/Mapbox-Custom%20Maps-green" alt="Mapbox"></a>
</p>

**KartIA** est une super-application mobile open-source combinant **intelligence artificielle (Google Gemini)**, **cartographie (Mapbox/OpenStreetMap)** et **backend Firebase** pour permettre aux citoyens africains de signaler, découvrir et contribuer à leur environnement local.

🌍 _Donnons vie à la cartographie en Afrique, ensemble_

## 🚀 Fonctionnalités

KartIA est une plateforme modulaire construite autour des besoins réels des communautés africaines :

### 📱 Module Signalement Communautaire (CivAct)
- Signalement géolocalisé de problèmes urbains (routes, éclairage, déchets...)
- Classification automatique par IA des problèmes à partir de photos
- Suivi de l'évolution des signalements
- Actions communautaires (votes, commentaires)

### 🔍 Module Découverte Locale par l'IA (CityAI Guide)
- Recherche en langage naturel ("Où manger pas cher ?", "Où acheter des médicaments ?")
- Suggestions intelligentes basées sur les préférences de l'utilisateur
- Résumés générés par IA de lieux et établissements

### 🏥 Module SantéMap
- Cartographie des infrastructures médicales avec services détaillés
- Recherche par type de service médical
- Fiches d'établissements enrichies par IA
- Avis communautaire fiable sur la qualité des services

### 🗺️ Module OSM Helper
- Contribution simplifiée à OpenStreetMap sans compétences techniques
- L'IA analyse les photos pour suggérer automatiquement les tags OSM appropriés
- Mode hors-ligne pour zones à connectivité limitée
- Gamification des contributions (badges, niveaux)

### 💰 Module CartoPrix
- Cartographie participative des prix des produits essentiels (carburant, denrées alimentaires...)
- Visualisation par cartes thermiques des variations de prix
- Alertes sur les hausses significatives
- Analyse IA des tendances de prix


## 🛠️ Technologies utilisées

KartIA est construit avec les technologies modernes suivantes :

| Domaine | Technologies |
|---------|--------------|
| **Application Mobile** | Flutter, BLoC (State Management) |
| **Cartographie** | OpenStreetMap (données), Mapbox SDK (rendu) |
| **Backend** | Firebase (Auth, Firestore, Storage, Functions) |
| **Intelligence Artificielle** | Google Gemini API (Pro + Vision) |
| **CI/CD** | GitHub Actions |
| **Analytics** | Firebase Analytics |

## 🏗️ Architecture

KartIA suit une architecture Clean Architecture pour une séparation claire des responsabilités :

```
lib/
├── generated/         # Code généré automatiquement
├── l10n/              # Fichiers d'internationalisation
├── src/
│   ├── core/          # Composants partagés
│   │   ├── database/  # Gestion base de données locale
│   │   ├── di/        # Injection de dépendances
│   │   ├── helpers/   # Classes helper
│   │   ├── services/  # Services partagés
│   │   └── utils/     # Utilitaires divers
│   ├── data/          # Couche de données
│   │   ├── datasources/
│   │   ├── models/    
│   │   └── repositories/
│   ├── domain/        # Couche de domaine (logique métier)
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── modules/       # Modules fonctionnels
│   │   ├── app/       # Configuration app
│   │   ├── civact/    # Module Signalement
│   │   ├── city_ai_guide/ # Module Découverte
│   │   ├── sante_map/ # Module Santé
│   │   ├── osm_helper/ # Module OSM
│   │   └── carto_prix/ # Module Prix
│   ├── widgets/       # Widgets réutilisables
│   ├── app.dart       # Configuration app
│   ├── init.dart      # Initialisation
│   └── splash.screen.dart # Écran de démarrage
├── blocobserver.dart  # Observateur BLoC
└── main.dart          # Point d'entrée principal
```

## 🚦 Démarrage

### Prérequis

- Flutter SDK (3.29.3)
- Compte Firebase
- Compte Mapbox
- Compte Google AI Studio (pour Gemini API)

### Installation

1. Clonez le dépôt :
   ```bash
   git clone https://github.com/BorisGautier/kartia.git
   cd kartia
   ```

2. Installez les dépendances :
   ```bash
   flutter pub get
   ```

3. Créez un fichier `.env` à la racine du projet avec vos clés API :
   ```
   MAPBOX_API_KEY=your_mapbox_api_key
   ```

4. Configurez Firebase :
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

5. Lancez l'application :
   ```bash
   flutter run
   ```

## 🔄 Mode Hors-ligne

KartIA est conçu pour fonctionner dans des zones à connectivité limitée :

- Stockage local des données via Hive
- Mise en cache des tuiles de carte pour les zones fréquentes
- Upload différé des contributions lorsque la connexion est rétablie
- Fonctionnalités dégradées mais toujours utilisables sans connexion

## 🌐 Multilingue

KartIA est disponible en plusieurs langues :
- Français
- Anglais

## 🤝 Contribuer

Les contributions sont les bienvenues ! Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour les directives.

### Domaines où nous avons besoin d'aide

- **UI/UX** : Amélioration des interfaces utilisateur
- **Traductions** : Ajout de nouvelles langues africaines
- **Optimisation offline** : Amélioration de l'expérience hors-ligne
- **Documentation** : Tutoriels, guides d'utilisation
- **Tests** : Couverture de tests unitaires et d'intégration

## 🛣️ Roadmap

| Date | Milestone |
|------|-----------|
| Q3 2025 | MVP avec module Signalement et base cartographique |
| Q4 2025 | Alpha avec intégration IA et module Découverte |
| Q1 2026 | Beta avec modules SantéMap et OSM Helper |
| Q2 2026 | Version 1.0 avec module CartoPrix |

## 🔧 Configuration et Structure

### Structure du Projet
La structure du projet KartIA est organisée comme suit :
```
kartia/
├── android/                 # Configuration Android
├── ios/                     # Configuration iOS
├── lib/                     # Code Dart principal
├── cloud/                   # Fonctions Firebase Cloud
├── test/                    # Tests unitaires et d'intégration
├── docs/                    # Documentation
│   ├── architecture/        # Documentation d'architecture
│   └── screenshots/         # Captures d'écran
└── assets/                  # Ressources statiques
    ├── images/              # Images et icônes
    └── map_styles/          # Styles de cartes personnalisés
```

### Configuration Firebase

Le projet utilise Firebase pour le backend. Vous devez configurer :
- Authentication (Email, Google, Téléphone)
- Firestore Database
- Storage
- Cloud Functions
- Analytics et Crashlytics

Suivez notre [guide de configuration Firebase](docs/firebase_setup.md) pour plus de détails.

### Configuration Mapbox

1. Créez un compte sur [Mapbox](https://www.mapbox.com/)
2. Obtenez une clé API
3. Ajoutez-la à votre fichier `.env`
4. Configurez les styles de carte dans `assets/map_styles/`

### Configuration Gemini API

1. Créez un compte sur [Google AI Studio](https://makersuite.google.com/)
2. Créez une clé API pour Gemini
3. Ajoutez-la à votre fichier `.env`

## 🧪 Tests

Exécutez les tests unitaires et d'intégration :

```bash
# Tests unitaires
flutter test

# Tests d'intégration
flutter drive --target=test_driver/app.dart
```

## 📱 Variantes de Build

### Debug
```bash
flutter run --flavor dev -t lib/main_dev.dart
```

### Release
```bash
# Android
flutter build appbundle --flavor prod -t lib/main_prod.dart

# iOS
flutter build ipa --flavor prod -t lib/main_prod.dart
```

## 📄 Licence

Ce projet est sous licence MIT - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 🙏 Remerciements

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)
- [Mapbox](https://www.mapbox.com/)
- [OpenStreetMap](https://www.openstreetmap.org/)
- [Google Gemini](https://ai.google.dev/)
- Toute la communauté des contributeurs

---

⭐ Si ce projet vous intéresse, n'hésitez pas à lui donner une étoile et à le partager !

*Conçu avec ❤️ pour améliorer la cartographie participative en Afrique*