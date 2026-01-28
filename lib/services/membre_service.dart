// import 'dart:typed_data';

// import 'package:isar_community/isar.dart';

// import '../models/membre.dart';
// import '../main.dart'; // Pour accéder à isar

// class MembreService {
//   static Future<void> saveMembre({
//     required String categorie,
//     required String typeResponsable,
//     required String nomResponsable,
//     required String contactResponsable,
//     required Uint8List? photoBytes,
//     required String nom,
//     required String prenom,
//     required String age,
//     required String sexe,
//     required String classe,
//     required String dateNaissance,
//     required String lieuNaissance,
//     required String adresse,
//     required String personneUrgence,
//     required String contactUrgence,
//   }) async {
//     final nouveau = Membre()
//       ..categorie = categorie
//       ..typeResponsable = typeResponsable
//       ..nomResponsable = nomResponsable
//       ..contactResponsable = contactResponsable
//       ..photoBytes = photoBytes
//       ..nom = nom
//       ..prenom = prenom
//       ..age = age
//       ..sexe = sexe
//       ..classe = classe
//       ..dateNaissance = dateNaissance
//       ..lieuNaissance = lieuNaissance
//       ..adresse = adresse
//       ..personneUrgence = personneUrgence
//       ..contactUrgente = contactUrgence;

//     await isar.writeTxn(() async {
//       await isar.membres.put(nouveau);
//     });
//   }

//   // Pour récupérer la liste (ex: historique)
//   static Future<List<Membre>> getAllByCategorie(String categorie) async {
//     return await isar.membres.filter().categorieEqualTo(categorie).findAll();
//   }
// }

import 'dart:typed_data';
import 'package:isar_community/isar.dart';
import '../models/membre.dart';
import '../main.dart'; // Pour accéder à isar

class MembreService {
  static Future<void> saveMembre({
    required String categorie,
    required String typeResponsable,
    required String nomResponsable,
    required String contactResponsable,
    Uint8List? photoBytes, // ← Optionnel maintenant
    required String nom,
    required String prenom,
    required String age,
    required String sexe,
    required String classe,
    required String dateNaissance,
    required String lieuNaissance,
    required String adresse,
    required String personneUrgence,
    required String contactUrgence,
  }) async {
    final nouveau = Membre()
      ..categorie = categorie
      ..typeResponsable = typeResponsable
      ..nomResponsable = nomResponsable
      ..contactResponsable = contactResponsable
      ..photoBytes = photoBytes
      ..nom = nom
      ..prenom = prenom
      ..age = age
      ..sexe = sexe
      ..classe = classe
      ..dateNaissance = dateNaissance
      ..lieuNaissance = lieuNaissance
      ..adresse = adresse
      ..personneUrgence = personneUrgence
      ..contactUrgente = contactUrgence;

    await isar.writeTxn(() async {
      await isar.membres.put(nouveau);
    });
  }

  // Récupérer tous les membres d'une catégorie
  static Future<List<Membre>> getAllByCategorie(String categorie) async {
    return await isar.membres.filter().categorieEqualTo(categorie).findAll();
  }
}
