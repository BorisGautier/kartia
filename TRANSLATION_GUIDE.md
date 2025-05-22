# 🌍 Guide de Traduction - KartIA

Ce guide vous explique comment ajouter une nouvelle langue ou améliorer les traductions existantes dans KartIA.

## 📋 Table des matières

1. [Vue d'ensemble](#vue-densemble)
2. [Langues supportées](#langues-supportées)
3. [Structure des fichiers de traduction](#structure-des-fichiers-de-traduction)
4. [Ajouter une nouvelle langue](#ajouter-une-nouvelle-langue)
5. [Modifier les traductions existantes](#modifier-les-traductions-existantes)
6. [Conventions de traduction](#conventions-de-traduction)
7. [Tests et validation](#tests-et-validation)
8. [Contribution](#contribution)
9. [Ressources](#ressources)

---

## 🌐 Vue d'ensemble

KartIA utilise le système d'internationalisation (i18n) de Flutter avec les packages :
- **`flutter_localizations`** : Support des locales Flutter
- **`intl`** : Formatage des dates, nombres et messages
- **ARB (Application Resource Bundle)** : Format standard pour les traductions

### Architecture i18n

```
lib/
├── l10n/
│   ├── app_en.arb           # Anglais (langue de référence)
│   ├── app_fr.arb           # Français
│   ├── app_ar.arb           # Arabe (à venir)
│   ├── app_sw.arb           # Swahili (à venir)
│   └── app_wo.arb           # Wolof (à venir)
├── generated/
│   └── l10n/
│       ├── app_localizations.dart
│       ├── app_localizations_en.dart
│       ├── app_localizations_fr.dart
│       └── ...
└── src/
    └── core/
        └── l10n/
            └── l10n.dart    # Configuration des locales
```

---

## 🗣️ Langues supportées

### Langues actuelles ✅

| Langue | Code | Statut | Progression | Contributeur principal |
|--------|------|--------|-------------|----------------------|
| **Français** | `fr` | 🟢 Complet | 100% | Boris Gautier TCHOUKOUAHA |
| **Anglais** | `en` | 🟢 Complet | 100% | Boris Gautier TCHOUKOUAHA |

### Langues prévues 🚧

| Langue | Code | Priorité | Région cible | Recherche contributeur |
|--------|------|----------|--------------|----------------------|
| **Arabe** | `ar` | Haute | Afrique du Nord | 🔍 Recherché |
| **Swahili** | `sw` | Haute | Afrique de l'Est | 🔍 Recherché |
| **Wolof** | `wo` | Moyenne | Afrique de l'Ouest | 🔍 Recherché |
| **Hausa** | `ha` | Moyenne | Afrique de l'Ouest | 🔍 Recherché |
| **Amharique** | `am` | Faible | Éthiopie | 🔍 Recherché |
| **Portugais** | `pt` | Faible | Angola, Mozambique | 🔍 Recherché |

---

## 📁 Structure des fichiers de traduction

### Format ARB

Les fichiers ARB utilisent le format JSON avec des métadonnées supplémentaires :

```json
{
  "@@locale": "fr",
  "@@last_modified": "2025-05-22T10:00:00.000Z",
  "@@author": "Boris Gautier TCHOUKOUAHA",
  
  "appName": "KartIA",
  "@appName": {
    "description": "Le nom de l'application"
  },
  
  "welcome": "Bienvenue sur KartIA",
  "@welcome": {
    "description": "Message de bienvenue affiché sur l'écran d'accueil"
  },
  
  "userGreeting": "Bonjour {userName} !",
  "@userGreeting": {
    "description": "Salutation personnalisée avec le nom de l'utilisateur",
    "placeholders": {
      "userName": {
        "type": "String",
        "example": "Jean"
      }
    }
  }
}
```

### Organisation par catégories

```json
{
  "@@locale": "fr",
  
  // === GÉNÉRAL ===
  "appName": "KartIA",
  "loading": "Chargement...",
  "error": "Erreur",
  "success": "Succès",
  "cancel": "Annuler",
  "confirm": "Confirmer",
  "save": "Enregistrer",
  "delete": "Supprimer",
  "edit": "Modifier",
  "close": "Fermer",
  
  // === AUTHENTIFICATION ===
  "signIn": "Se connecter",
  "signUp": "S'inscrire",
  "signOut": "Se déconnecter",
  "email": "Email",
  "password": "Mot de passe",
  "forgotPassword": "Mot de passe oublié ?",
  
  // === NAVIGATION ===
  "homeTab": "Accueil",
  "mapTab": "Carte",
  "reportsTab": "Signalements",
  "profileTab": "Profil",
  
  // === MODULE SIGNALEMENT ===
  "reportTitle": "Nouveau signalement",
  "reportDescription": "Description du problème",
  "reportCategory": "Catégorie",
  "reportLocation": "Localisation",
  "submitReport": "Envoyer le signalement",
  
  // === MODULE DÉCOUVERTE ===
  "searchPlaceholder": "Que cherchez-vous ?",
  "aiSuggestions": "Suggestions IA",
  "nearbyPlaces": "Lieux à proximité",
  
  // === MODULE SANTÉ ===
  "healthFacilities": "Établissements de santé",
  "hospitals": "Hôpitaux",
  "clinics": "Cliniques",
  "pharmacies": "Pharmacies",
  
  // === MODULE OSM ===
  "contributeToOSM": "Contribuer à OSM",
  "addPlace": "Ajouter un lieu",
  "updateInfo": "Mettre à jour les informations",
  
  // === MODULE PRIX ===
  "priceTracking": "Suivi des prix",
  "productName": "Nom du produit",
  "currentPrice": "Prix actuel",
  "priceHistory": "Historique des prix"
}
```

---

## ➕ Ajouter une nouvelle langue

### Étape 1 : Créer le fichier ARB

1. **Copiez** le fichier de référence :
   ```bash
   cp lib/l10n/app_en.arb lib/l10n/app_[code_langue].arb
   ```

2. **Modifiez** l'en-tête :
   ```json
   {
     "@@locale": "sw",
     "@@last_modified": "2025-05-22T10:00:00.000Z",
     "@@author": "Votre Nom",
   ```

3. **Traduisez** tous les messages en conservant les clés.

### Étape 2 : Génération des fichiers

```bash
# Générer les fichiers de localisation
dart run intl_utils:generate 

# Vérifier que les nouveaux fichiers sont créés
ls lib/generated/l10n/
```

### Étape 3 : Tests

```dart
// test/l10n_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:kartia/generated/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  group('Localization Tests', () {
    test('Swahili localization loads correctly', () async {
      const locale = Locale('sw');
      final localizations = await AppLocalizations.delegate.load(locale);
      
      expect(localizations.appName, equals('KartIA'));
      expect(localizations.welcome, isNotEmpty);
      expect(localizations.signIn, isNotEmpty);
    });
  });
}
```

---

## ✏️ Modifier les traductions existantes

### Processus de modification

1. **Identifiez** la clé à modifier dans `app_en.arb`
2. **Modifiez** la traduction dans le fichier ARB correspondant
3. **Mettez à jour** la date `@@last_modified`
4. **Régénérez** les fichiers : `dart run intl_utils:generate`
5. **Testez** les changements dans l'application

### Exemple de modification

```json
// Avant
"welcomeMessage": "Bienvenue dans notre application"

// Après
"welcomeMessage": "Bienvenue sur KartIA - Cartographie participative"
```

---

## 📝 Conventions de traduction

### Règles générales

1. **Cohérence terminologique** : Utilisez toujours les mêmes termes pour les concepts identiques
2. **Adaptation culturelle** : Adaptez les expressions aux contextes locaux
3. **Neutralité inclusive** : Utilisez un langage inclusif et non-discriminatoire
4. **Clarté** : Privilégiez des termes simples et compréhensibles


### Gestion des pluriels

Flutter supporte les règles de pluriel complexes :

```json
{
  "reportCount": "{count, plural, =0{Aucun signalement} =1{1 signalement} other{{count} signalements}}",
  "@reportCount": {
    "description": "Nombre de signalements",
    "placeholders": {
      "count": {
        "type": "int"
      }
    }
  }
}
```

### Formatage des dates et nombres

```json
{
  "lastUpdate": "Dernière mise à jour : {date}",
  "@lastUpdate": {
    "description": "Date de dernière mise à jour",
    "placeholders": {
      "date": {
        "type": "DateTime",
        "format": "yMMMd"
      }
    }
  },
  
  "distance": "Distance : {distance} km",
  "@distance": {
    "description": "Distance en kilomètres",
    "placeholders": {
      "distance": {
        "type": "double",
        "format": "decimalPattern"
      }
    }
  }
}
```

---

## ✅ Tests et validation


### Validation manuelle

#### Checklist de validation

- [ ] **Cohérence** : Tous les termes sont traduits de manière cohérente
- [ ] **Complétude** : Aucune chaîne n'est manquante
- [ ] **Contexte** : Les traductions sont appropriées au contexte
- [ ] **UI** : Les textes s'affichent correctement dans l'interface
- [ ] **Pluriels** : Les règles de pluriel sont correctes
- [ ] **Dates/Nombres** : Le formatage est adapté à la locale
- [ ] **Longueur** : Les textes ne débordent pas de l'interface



## 🤝 Contribution

### Devenir traducteur

Pour contribuer aux traductions :

1. **Consultez** la liste des langues recherchées
2. **Contactez** l'équipe via [GitHub Issues](https://github.com/BorisGautier/kartia/issues)
3. **Indiquez** votre langue maternelle et votre expérience
4. **Recevez** l'accès au projet de traduction

### Processus de contribution

1. **Fork** le repository
2. **Créez** une branche pour votre traduction : `feature/translation-sw`
3. **Ajoutez** votre fichier ARB
4. **Testez** localement
5. **Soumettez** une Pull Request avec :
   - Description de la langue ajoutée
   - Niveau de complétude
   - Screenshots si nécessaire

### Template de Pull Request

```markdown
## 🌍 Nouvelle traduction : [Nom de la langue]

### Informations
- **Langue** : [Nom complet]
- **Code ISO** : [Code à 2 lettres]
- **Région** : [Régions où elle est parlée]
- **Progression** : [X%]

### Traducteur
- **Nom** : [Votre nom]
- **Langue maternelle** : [Oui/Non]
- **Expérience** : [Description de votre expérience en traduction]

### Vérifications
- [ ] Tous les strings essentiels sont traduits
- [ ] Tests de localisation passent
- [ ] Interface testée avec la nouvelle langue
- [ ] Conventions de traduction respectées

### Notes supplémentaires
[Commentaires éventuels sur des choix de traduction spécifiques]
```

---

## 📚 Ressources

### Documentation officielle
- [Flutter Internationalization](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
- [ARB Format Specification](https://github.com/google/app-resource-bundle)
- [Intl Package Documentation](https://pub.dev/packages/intl)

### Outils recommandés
- **[Poedit](https://poedit.net/)** : Éditeur de traductions
- **[Google Translate](https://translate.google.com/)** : Traduction automatique (à réviser)
- **[DeepL](https://www.deepl.com/)** : Traduction de qualité
- **[Crowdin](https://crowdin.com/)** : Plateforme de traduction collaborative

### Ressources linguistiques
- **[Unicode CLDR](http://cldr.unicode.org/)** : Données de localisation
- **[ISO 639 Language Codes](https://www.iso.org/iso-639-language-codes.html)**
- **[Language Tag Registry](https://www.iana.org/assignments/language-subtag-registry)**

### Communautés africaines
- **[African Language Technology](https://github.com/masakhane-io)** : Ressources NLP pour langues africaines
- **[Common Voice](https://commonvoice.mozilla.org/)** : Données vocales multilingues
- **[DigitalEuropa](https://www.digital-platform.europa.eu/)** : Initiatives numériques multilingues

---

## 📋 Checklist du traducteur

### Avant de commencer
- [ ] Lecture complète de ce guide
- [ ] Compréhension du contexte de KartIA
- [ ] Installation de l'environnement de développement
- [ ] Contact avec l'équipe principale

### Pendant la traduction
- [ ] Respect des conventions terminologiques
- [ ] Test régulier dans l'application
- [ ] Documentation des choix difficiles
- [ ] Cohérence avec les autres traductions

### Avant soumission
- [ ] Relecture complète
- [ ] Tests de tous les écrans
- [ ] Vérification des pluriels et formats
- [ ] Validation par un locuteur natif (si possible)

---

💡 **Besoin d'aide ?** Contactez l'équipe via [GitHub Discussions](https://github.com/BorisGautier/kartia/discussions) ou ouvrez une [issue](https://github.com/BorisGautier/kartia/issues) avec le tag `translation`.

🌍 **Ensemble, rendons KartIA accessible à tous les africains !**