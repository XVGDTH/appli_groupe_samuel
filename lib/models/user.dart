import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:isar_community/isar.dart'; // Pour utf8.encode

part 'user.g.dart'; // Fichier généré automatiquement

@Collection()
class User {
  Id id = Isar.autoIncrement; // ID auto-généré

  @Index(
    caseSensitive: false,
  ) // Index pour recherche rapide, insensible à la casse
  late String nom;

  @Index(caseSensitive: false)
  late String prenom;

  @Index(
    unique: true,
    caseSensitive: false,
  ) // Email unique si fourni, optionnel
  String? email; // Optionnel (peut être null ou vide)

  @Index(unique: true)
  late String telephone; // Requis, unique

  late String passwordHash; // Mot de passe hashé (SHA-256)

  // Méthode statique pour hasher un mot de passe
  static String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
