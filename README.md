# KartIA

<p align="center">
  <img src="assets/images/logo.png" alt="KartIA Logo" width="200"/>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.29.3-blue.svg?logo=flutter" alt="Flutter Version"></a>
  <a href="https://opensource.org/licenses/Apache-2.0"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License: Apache 2.0"></a>
  <a href="https://firebase.google.com"><img src="https://img.shields.io/badge/Firebase-Enabled-orange?logo=firebase" alt="Firebase"></a>
  <a href="https://www.mapbox.com"><img src="https://img.shields.io/badge/Mapbox-Custom%20Maps-green?logo=mapbox" alt="Mapbox"></a>
</p>

<p align="center">
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.6.0-0175C2?logo=dart" alt="Dart Version"></a>
  <a href="https://github.com/BorisGautier/kartia/actions"><img src="https://img.shields.io/github/actions/workflow/status/BorisGautier/kartia/ci.yml?logo=github" alt="Build Status"></a>
  <a href="https://codecov.io/gh/BorisGautier/kartia"><img src="https://img.shields.io/codecov/c/github/BorisGautier/kartia?logo=codecov" alt="Coverage"></a>
  <a href="https://github.com/BorisGautier/kartia/releases"><img src="https://img.shields.io/github/v/release/BorisGautier/kartia?logo=github" alt="Latest Release"></a>
</p>

<p align="center">
  <a href="https://github.com/BorisGautier/kartia/stargazers"><img src="https://img.shields.io/github/stars/BorisGautier/kartia?style=social" alt="GitHub Stars"></a>
  <a href="https://github.com/BorisGautier/kartia/forks"><img src="https://img.shields.io/github/forks/BorisGautier/kartia?style=social" alt="GitHub Forks"></a>
  <a href="https://github.com/BorisGautier/kartia/issues"><img src="https://img.shields.io/github/issues/BorisGautier/kartia?logo=github" alt="Issues"></a>
  <a href="https://github.com/BorisGautier/kartia/pulls"><img src="https://img.shields.io/github/issues-pr/BorisGautier/kartia?logo=github" alt="Pull Requests"></a>
</p>

<p align="center">
  <a href="https://www.openstreetmap.org"><img src="https://img.shields.io/badge/OpenStreetMap-Supported-7EBC6F?logo=openstreetmap" alt="OSM"></a>
  <a href="https://ai.google.dev"><img src="https://img.shields.io/badge/Google%20Gemini-AI%20Powered-4285f4?logo=google" alt="Google Gemini"></a>
  <a href="https://bloc.dev"><img src="https://img.shields.io/badge/State%20Management-BLoC-orange?logo=flutter" alt="BLoC"></a>
  <a href="https://github.com/BorisGautier/kartia/blob/main/CONTRIBUTING.md"><img src="https://img.shields.io/badge/Contributions-Welcome-brightgreen" alt="Contributions Welcome"></a>
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
| **Application Mobile** | Flutter 3.29.3, Dart 3.6.0, BLoC (State Management) |
| **Cartographie** | OpenStreetMap (données), Mapbox SDK (rendu) |
| **Backend** | Firebase (Auth, Firestore, Storage, Functions) |
| **Intelligence Artificielle** | Google Gemini API (Pro + Vision) |
| **Base de données locale** | Drift (SQLite) |
| **CI/CD** | GitHub Actions |
| **Analytics** | Firebase Analytics, Crashlytics |
| **Tests** | flutter_test, integration_test, mockito |

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

- **Flutter SDK** (3.29.3 ou supérieur)
- **Dart SDK** (3.6.0 ou supérieur)
- **Android Studio** / **VS Code** avec extensions Flutter
- **Compte Firebase** (gratuit)
- **Compte Mapbox** (gratuit avec quota)
- **Compte Google AI Studio** (pour Gemini API)

### Installation

1. **Clonez le dépôt :**
   ```bash
   git clone https://github.com/BorisGautier/kartia.git
   cd kartia
   ```

2. **Vérifiez votre environnement Flutter :**
   ```bash
   flutter doctor
   ```

3. **Installez les dépendances :**
   ```bash
   flutter pub get
   ```

4. **Créez un fichier `.env` à la racine du projet :**
   ```env
   # Mapbox
   MAPBOX_API_KEY=your_mapbox_api_key_here
   
   # Environnement
   ENVIRONMENT=development
   ```

5. **Configurez Firebase :**
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

6. **Générez les fichiers de localisation :**
   ```bash
   dart run intl_utils:generate 
   ```

7. **Lancez l'application :**
   ```bash
   # Mode développement
   flutter run --flavor dev -t lib/main_dev.dart
   
   # Mode production
   flutter run --flavor prod -t lib/main_prod.dart
   ```

## 🔄 Mode Hors-ligne

KartIA est conçu pour fonctionner dans des zones à connectivité limitée :

- **Stockage local** des données via Drift (SQLite)
- **Mise en cache** des tuiles de carte pour les zones fréquentes
- **Upload différé** des contributions lorsque la connexion est rétablie
- **Fonctionnalités dégradées** mais toujours utilisables sans connexion
- **Synchronisation intelligente** en arrière-plan

## 🌐 Multilingue

KartIA est disponible en plusieurs langues :
- 🇫🇷 **Français** (langue principale)
- 🇬🇧 **Anglais**
- 🚧 **Prochainement :** Arabe, Swahili, Wolof

Pour ajouter une nouvelle langue, consultez notre [guide de traduction](TRANSLATION_GUIDE.md).

## 🤝 Contribuer

Les contributions sont les bienvenues ! Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour les directives.

### Domaines où nous avons besoin d'aide

- **🎨 UI/UX** : Amélioration des interfaces utilisateur
- **🌍 Traductions** : Ajout de nouvelles langues
- **📱 Optimisation offline** : Amélioration de l'expérience hors-ligne
- **📚 Documentation** : Tutoriels, guides d'utilisation
- **🧪 Tests** : Couverture de tests unitaires et d'intégration
- **🗺️ Données cartographiques** : Enrichissement des données OSM
- **🤖 IA** : Amélioration des algorithmes de classification

### Comment contribuer

1. **Fork** le projet
2. **Créez** votre branche feature (`git checkout -b feature/AmazingFeature`)
3. **Committez** vos changements (`git commit -m 'Add some AmazingFeature'`)
4. **Push** vers la branche (`git push origin feature/AmazingFeature`)
5. **Ouvrez** une Pull Request

## 🛣️ Roadmap

| Période | Milestone | Statut |
|---------|-----------|--------|
| **Q3 2025** | MVP avec module Signalement et base cartographique | 🚧 En cours |
| **Q4 2025** | Alpha avec intégration IA et module Découverte | 📋 Planifié |
| **Q1 2026** | Beta avec modules SantéMap et OSM Helper | 📋 Planifié |
| **Q2 2026** | Version 1.0 avec module CartoPrix | 📋 Planifié |
| **Q3 2026** | Extensions communautaires et APIs publiques | 📋 Planifié |

## 🔧 Configuration et Structure

### Structure du Projet
```
kartia/
├── android/                 # Configuration Android
├── ios/                     # Configuration iOS
├── lib/                     # Code Dart principal
├── cloud/                   # Fonctions Firebase Cloud
├── test/                    # Tests unitaires et d'intégration
├── docs/                    # Documentation
│   ├── architecture/        # Documentation d'architecture
│   ├── api/                 # Documentation API
│   └── screenshots/         # Captures d'écran
├── assets/                  # Ressources statiques
│   ├── images/              # Images et icônes
│   ├── map_styles/          # Styles de cartes personnalisés
│   └── translations/        # Fichiers de traduction
├── .github/                 # Configuration GitHub
│   └── workflows/           # GitHub Actions
└── scripts/                 # Scripts de build et déploiement
```

### Configuration des APIs

#### Mapbox
1. Créez un compte sur [Mapbox](https://www.mapbox.com/)
2. Obtenez une clé API
3. Ajoutez-la à votre fichier `.env`
4. Configurez les styles de carte dans `assets/map_styles/`

#### Google Gemini API
1. Créez un compte sur [Google AI Studio](https://makersuite.google.com/)
2. Créez une clé API pour Gemini
3. Ajoutez-la à votre fichier `.env`

## 🧪 Tests

### Tests unitaires
```bash
flutter test
```

### Tests d'intégration
```bash
flutter drive --target=test_driver/app.dart
```

### Tests de widget
```bash
flutter test test/widget_test/
```

### Couverture de code
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## 📱 Variantes de Build

### Environnement de développement
```bash
flutter run --flavor dev -t lib/main_dev.dart
```

### Environnement de staging
```bash
flutter run --flavor staging -t lib/main_staging.dart
```

### Production
```bash
# Android
flutter build appbundle --flavor prod -t lib/main_prod.dart

# iOS
flutter build ipa --flavor prod -t lib/main_prod.dart
```

## 🚀 Déploiement

### Android (Google Play Store)
```bash
flutter build appbundle --release --flavor prod
```

### iOS (App Store)
```bash
flutter build ipa --release --flavor prod
```

### Déploiement automatique
Les déploiements sont automatisés via GitHub Actions. Consultez `.github/workflows/` pour plus de détails.

## 📊 Métriques et Monitoring

- **Firebase Analytics** : Suivi de l'usage
- **Crashlytics** : Rapports de crash
- **Performance Monitoring** : Surveillance des performances
- **Remote Config** : Configuration à distance
- **Graylog** : Centralisation des logs

## 🔒 Sécurité

- **Chiffrement** des données sensibles
- **Authentification** sécurisée via Firebase
- **Validation** côté serveur avec Cloud Functions
- **Respect** du RGPD et des données personnelles

## 📄 Licence

Ce projet est sous licence Apache 2.0 - voir le fichier [LICENSE](LICENSE) pour plus de détails.

### Résumé de la licence
- ✅ **Usage commercial** autorisé
- ✅ **Modification** autorisée
- ✅ **Distribution** autorisée
- ✅ **Utilisation privée** autorisée
- ⚖️ **Attribution** requise
- ⚖️ **Conservation** des notices de licence
- 🛡️ **Protection** contre les litiges de brevets

## 🙏 Remerciements

- **[Flutter Team](https://flutter.dev/)** pour le framework exceptionnel
- **[Firebase Team](https://firebase.google.com/)** pour l'infrastructure backend
- **[Mapbox](https://www.mapbox.com/)** pour les outils cartographiques
- **[OpenStreetMap](https://www.openstreetmap.org/)** pour les données cartographiques libres
- **[Google AI](https://ai.google.dev/)** pour l'API Gemini
- **[Communauté open source](https://github.com/BorisGautier/kartia/graphs/contributors)** pour les contributions
- **Organisations africaines** pour le feedback et les tests terrain

## 📞 Support & Contact

- **Issues GitHub** : [Signaler un bug](https://github.com/BorisGautier/kartia/issues)
- **Discussions** : [Forum communautaire](https://github.com/BorisGautier/kartia/discussions)
- **Email** : me@borisgautier.com
- **Twitter** : [@BorisGautier](https://twitter.com/BorisGautier)

## 📈 Statistiques

![GitHub commit activity](https://img.shields.io/github/commit-activity/m/BorisGautier/kartia)
![GitHub last commit](https://img.shields.io/github/last-commit/BorisGautier/kartia)
![GitHub contributors](https://img.shields.io/github/contributors/BorisGautier/kartia)

---

⭐ **Si ce projet vous intéresse, n'hésitez pas à lui donner une étoile et à le partager !**

*Conçu avec ❤️ pour améliorer la cartographie participative en Afrique*

---

<p align="center">
  <img src="https://img.shields.io/badge/Made%20in-Cameroon%20🇨🇲-success" alt="Made in Cameroon">
  <img src="https://img.shields.io/badge/For-Africa%20🌍-yellow" alt="For Africa">
</p>