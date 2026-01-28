import 'dart:typed_data';

import 'package:isar_community/isar.dart';

part 'notification_model.g.dart';

@Collection()
class NotificationModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String categorie; // Debutant, Promettant, Missionnaire, Aine

  late String titre;
  late String message;
  late DateTime dateCreation;
  late bool estLue;

  // Détails du membre
  late String nomMembre;
  late String prenomMembre;
  late String ageMembre;
  late String classeMembre;
  late String sexeMembre;
  late String nomResponsable;
  late String contactResponsable;
  late String typeResponsable;
  late String contactUrgence;
  late String personneUrgence;

  // Photo (optionnelle)
  List<byte>? photoBytes;

  // ✅ AJOUTEZ @ignore pour éviter qu'Isar stocke ce getter
  @ignore
  Uint8List? get photoAsUint8List {
    if (photoBytes == null) return null;
    return Uint8List.fromList(photoBytes!);
  }
}
