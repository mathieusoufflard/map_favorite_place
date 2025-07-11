# 🗺️ Map Favorite Place

Une application Flutter simple permettant d'afficher des lieux sur une carte, avec un filtre par catégorie et une fiche détaillée pour chaque lieu.

## 📱 Fonctionnalités

- Affichage des lieux sur une carte OpenStreetMap via `flutter_map`.
- Filtrage des lieux par catégorie (Tous, Culturel, Restauration, Shopping).
- Affichage d'une fiche détaillée avec image, nom, catégorie et description lors du clic sur un marqueur.
- Widgets personnalisés réutilisables (`CustomText`, `CustomImageNetwork`).
- Logique métier testée unitairement (filtrage des lieux).
- Test widget de l’interface de filtrage.

## 🧱 Structure principale

lib/

├── backend/

│ ├── data/ # Données locales (place_data.dart)

│ ├── model/ # Modèle Place

│ └── utils/ # Utilitaire de filtrage (place_utils.dart)

├── ui/

│ └── widgets/ # Widgets réutilisables (CustomText, CustomImageNetwork)

└── pages/

└── home_page.dart # Écran principal


## 🚀 Lancer l'application

1. **Cloner le projet**
```bash
git clone <repository-url>
cd map_favorite_place
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Lancer l’application**
```bash
flutter run
```

## 🧪 Lancer les tests

** ✅ Test unitaire (filtrage des lieux) **
Teste la logique métier de filtrage des lieux par catégorie.

```bash
flutter test test/unit/place_utils_test.dart
```
** 🧩 Test widget (UI du filtre) **
Teste le comportement du filtre UI sur la page principale.

```bash
flutter test test/widget/home_page_test.dart
```
** Ou exécute tous les tests : ** 
```bash
flutter test
```

## 📦 Dépendances principales
flutter_map : Affichage de carte OpenStreetMap

latlong2 : Représentation des coordonnées géographiques

flutter_test : Framework de test Flutter

## 🛠️ À propos du code
La logique de filtrage est extraite dans place_utils.dart pour être facilement testable.

Les widgets CustomText et CustomImageNetwork assurent cohérence et réutilisabilité du design.

Le widget SegmentedButton permet à l’utilisateur de filtrer dynamiquement les lieux affichés.

## 📄 Licence
Ce projet est fourni à des fins d’évaluation technique.
