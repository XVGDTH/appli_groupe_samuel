import 'dart:typed_data';
import 'package:isar_community/isar.dart';

part 'membre.g.dart';

@Collection()
class Membre {
  Id id = Isar.autoIncrement;

  // Catégorie pour distinguer
  String? categorie; // "Debutant", "Promettant", "Missionnaire", "Aine"

  // Responsable
  String? typeResponsable; // "Dirigeant" ou "Aîné"
  String? nomResponsable;
  String? contactResponsable;

  // Infos personne
  @Index() // Index pour optimiser les recherches par nom
  String? nom;
  String? prenom;
  String? age;
  String? sexe; // "Masculin" / "Féminin"
  String? classe;
  String? dateNaissance; // Format JJ/MM/AAAA
  String? lieuNaissance;
  String? adresse;

  // Contact urgence
  String? personneUrgence;
  String? contactUrgente;

  // Infos médicales (optionnelles)
  String? groupeSanguin;
  String? allergies;

  // Photo stockée comme List<byte>
  List<byte>? photoBytes;

  // Date d'inscription (automatique)
  DateTime dateInscription = DateTime.now();

  // ✅ IGNORE ces getters/setters car Isar ne les stocke pas
  @ignore
  Uint8List? get photoBytesAsUint8List {
    return photoBytes != null ? Uint8List.fromList(photoBytes!) : null;
  }

  @ignore
  set photoBytesAsUint8List(Uint8List? bytes) {
    photoBytes = bytes?.toList();
  }
}
