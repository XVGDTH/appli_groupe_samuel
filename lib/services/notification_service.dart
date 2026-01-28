// import 'package:isar_community/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import '../models/notification_model.dart';

// class NotificationService {
//   static Isar? _isar;

//   // Initialiser Isar
//   static Future<Isar> _getIsar() async {
//     if (_isar != null) return _isar!;

//     final dir = await getApplicationDocumentsDirectory();
//     _isar = await Isar.open([NotificationModelSchema], directory: dir.path);
//     return _isar!;
//   }

//   // Créer une notification lors d'une inscription
//   static Future<void> creerNotification({
//     required String categorie,
//     required String nom,
//     required String prenom,
//     required String age,
//     required String classe,
//     required String sexe,
//     required String nomResponsable,
//     required String contactResponsable,
//     required String typeResponsable,
//     required String contactUrgence,
//     required String personneUrgence,
//     List<int>? photoBytes,
//   }) async {
//     final isar = await _getIsar();

//     final notification = NotificationModel()
//       ..categorie = categorie
//       ..titre = 'Nouvelle inscription : $categorie'
//       ..message = '$prenom $nom a été inscrit(e) avec succès'
//       ..dateCreation = DateTime.now()
//       ..estLue = false
//       ..nomMembre = nom
//       ..prenomMembre = prenom
//       ..ageMembre = age
//       ..classeMembre = classe
//       ..sexeMembre = sexe
//       ..nomResponsable = nomResponsable
//       ..contactResponsable = contactResponsable
//       ..typeResponsable = typeResponsable
//       ..contactUrgence = contactUrgence
//       ..personneUrgence = personneUrgence
//       ..photoBytes = photoBytes;

//     await isar.writeTxn(() async {
//       await isar.notificationModels.put(notification);
//     });
//   }

//   // Récupérer toutes les notifications
//   static Future<List<NotificationModel>> getAllNotifications() async {
//     final isar = await _getIsar();
//     return await isar.notificationModels
//         .where()
//         .sortByDateCreationDesc()
//         .findAll();
//   }

//   // Récupérer les notifications non lues
//   static Future<List<NotificationModel>> getNotificationsNonLues() async {
//     final isar = await _getIsar();
//     return await isar.notificationModels
//         .filter()
//         .estLueEqualTo(false)
//         .sortByDateCreationDesc()
//         .findAll();
//   }

//   // Compter les notifications non lues
//   static Future<int> compterNotificationsNonLues() async {
//     final isar = await _getIsar();
//     return await isar.notificationModels.filter().estLueEqualTo(false).count();
//   }

//   // Marquer une notification comme lue
//   static Future<void> marquerCommeLue(int notificationId) async {
//     final isar = await _getIsar();
//     final notification = await isar.notificationModels.get(notificationId);

//     if (notification != null) {
//       notification.estLue = true;
//       await isar.writeTxn(() async {
//         await isar.notificationModels.put(notification);
//       });
//     }
//   }

//   // Marquer toutes les notifications comme lues
//   static Future<void> marquerToutesCommeLues() async {
//     final isar = await _getIsar();
//     final notifications = await getNotificationsNonLues();

//     await isar.writeTxn(() async {
//       for (var notif in notifications) {
//         notif.estLue = true;
//         await isar.notificationModels.put(notif);
//       }
//     });
//   }

//   // Supprimer une notification
//   static Future<void> supprimerNotification(int notificationId) async {
//     final isar = await _getIsar();
//     await isar.writeTxn(() async {
//       await isar.notificationModels.delete(notificationId);
//     });
//   }

//   // Supprimer toutes les notifications
//   static Future<void> supprimerToutesLesNotifications() async {
//     final isar = await _getIsar();
//     await isar.writeTxn(() async {
//       await isar.notificationModels.clear();
//     });
//   }

//   // Récupérer les notifications par catégorie
//   static Future<List<NotificationModel>> getNotificationsByCategorie(
//     String categorie,
//   ) async {
//     final isar = await _getIsar();
//     return await isar.notificationModels
//         .filter()
//         .categorieEqualTo(categorie)
//         .sortByDateCreationDesc()
//         .findAll();
//   }
// }

import 'package:isar_community/isar.dart';
import '../models/notification_model.dart';
import '../main.dart'; // ✅ IMPORTANT : Importer pour accéder à l'instance globale isar

class NotificationService {
  // ❌ SUPPRIMEZ CETTE PARTIE
  // static Isar? _isar;
  // static Future<Isar> _getIsar() async { ... }

  // ✅ Utilisez directement l'instance globale 'isar' de main.dart

  // Créer une notification lors d'une inscription
  static Future<void> creerNotification({
    required String categorie,
    required String nom,
    required String prenom,
    required String age,
    required String classe,
    required String sexe,
    required String nomResponsable,
    required String contactResponsable,
    required String typeResponsable,
    required String contactUrgence,
    required String personneUrgence,
    List<int>? photoBytes,
  }) async {
    final notification = NotificationModel()
      ..categorie = categorie
      ..titre = 'Nouvelle inscription : $categorie'
      ..message = '$prenom $nom a été inscrit(e) avec succès'
      ..dateCreation = DateTime.now()
      ..estLue = false
      ..nomMembre = nom
      ..prenomMembre = prenom
      ..ageMembre = age
      ..classeMembre = classe
      ..sexeMembre = sexe
      ..nomResponsable = nomResponsable
      ..contactResponsable = contactResponsable
      ..typeResponsable = typeResponsable
      ..contactUrgence = contactUrgence
      ..personneUrgence = personneUrgence
      ..photoBytes = photoBytes;

    await isar.writeTxn(() async {
      await isar.notificationModels.put(notification);
    });
  }

  // Récupérer toutes les notifications
  static Future<List<NotificationModel>> getAllNotifications() async {
    return await isar.notificationModels
        .where()
        .sortByDateCreationDesc()
        .findAll();
  }

  // Récupérer les notifications non lues
  static Future<List<NotificationModel>> getNotificationsNonLues() async {
    return await isar.notificationModels
        .filter()
        .estLueEqualTo(false)
        .sortByDateCreationDesc()
        .findAll();
  }

  // Compter les notifications non lues
  static Future<int> compterNotificationsNonLues() async {
    return await isar.notificationModels.filter().estLueEqualTo(false).count();
  }

  // Marquer une notification comme lue
  static Future<void> marquerCommeLue(int notificationId) async {
    final notification = await isar.notificationModels.get(notificationId);

    if (notification != null) {
      notification.estLue = true;
      await isar.writeTxn(() async {
        await isar.notificationModels.put(notification);
      });
    }
  }

  // Marquer toutes les notifications comme lues
  static Future<void> marquerToutesCommeLues() async {
    final notifications = await getNotificationsNonLues();

    await isar.writeTxn(() async {
      for (var notif in notifications) {
        notif.estLue = true;
        await isar.notificationModels.put(notif);
      }
    });
  }

  // Supprimer une notification
  static Future<void> supprimerNotification(int notificationId) async {
    await isar.writeTxn(() async {
      await isar.notificationModels.delete(notificationId);
    });
  }

  // Supprimer toutes les notifications
  static Future<void> supprimerToutesLesNotifications() async {
    await isar.writeTxn(() async {
      await isar.notificationModels.clear();
    });
  }

  // Récupérer les notifications par catégorie
  static Future<List<NotificationModel>> getNotificationsByCategorie(
    String categorie,
  ) async {
    return await isar.notificationModels
        .filter()
        .categorieEqualTo(categorie)
        .sortByDateCreationDesc()
        .findAll();
  }
}
