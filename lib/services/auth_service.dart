import 'package:isar_community/isar.dart';

import '../models/user.dart'; // Chemin vers ton modèle User
import '../main.dart'; // Pour accéder à l'instance globale 'isar'

class AuthService {
  static Future<bool> register({
    required String nom,
    required String prenom,
    String? email,
    required String telephone,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword || password.length < 6) {
      return false;
    }

    // Vérifie si le téléphone existe déjà
    final existingUser = await isar.users
        .filter()
        .telephoneEqualTo(telephone)
        .findFirst();

    if (existingUser != null) {
      return false; // Téléphone déjà utilisé
    }

    final newUser = User()
      ..nom = nom
      ..prenom = prenom
      ..email = email
      ..telephone = telephone
      ..passwordHash = User.hashPassword(password);

    await isar.writeTxn(() async {
      await isar.users.put(newUser);
    });

    return true;
  }

  // Tu pourras utiliser cette fonction plus tard dans login.dart
  static Future<User?> login({
    required String username,
    required String password,
  }) async {
    final hashed = User.hashPassword(password);
    return await isar.users
        .filter()
        .passwordHashEqualTo(hashed)
        .and()
        .group(
          (q) => q
              .nomEqualTo(username, caseSensitive: false)
              .or()
              .prenomEqualTo(username, caseSensitive: false),
        )
        .findFirst();
  }
}
