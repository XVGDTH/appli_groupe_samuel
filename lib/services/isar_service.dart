import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

// Importez TOUS vos modèles
import '../models/user.dart';
import '../models/membre.dart';
import '../models/notification_model.dart';

class IsarService {
  static Isar? _isar;

  // Méthode d'initialisation (à appeler dans main.dart)
  static Future<void> init() async {
    if (_isar != null && _isar!.isOpen) {
      return; // Déjà initialisé
    }

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      // ✅ METTEZ TOUS vos schémas ici
      [
        UserSchema,
        MembreSchema,
        NotificationModelSchema,
        // Ajoutez d'autres modèles si vous en avez
      ],
      directory: dir.path,
      inspector: true, // Pour le debug
    );
  }

  // Getter pour accéder à Isar n'importe où
  static Future<Isar> get instance async {
    if (_isar == null || !_isar!.isOpen) {
      await init();
    }
    return _isar!;
  }

  // Méthodes pratiques pour accéder aux collections
  static Future<IsarCollection<User>> get users async {
    final isar = await instance;
    return isar.users;
  }

  static Future<IsarCollection<Membre>> get membres async {
    final isar = await instance;
    return isar.membres;
  }

  static Future<IsarCollection<NotificationModel>> get notifications async {
    final isar = await instance;
    return isar.notificationModels;
  }

  // Pour fermer proprement (optionnel)
  static Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}
