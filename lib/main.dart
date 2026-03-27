import 'package:flutter/material.dart';
import 'package:groupe_samuel_appli/models/membre.dart';
import 'package:groupe_samuel_appli/models/notification_model.dart'; // ✅ AJOUTEZ CETTE LIGNE
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'mon_appli/acceuil/views/acceuil.dart';
import 'models/user.dart';

late Isar isar;

// ✅ Fonction initIsar avec TOUS les schémas (User, Membre, NotificationModel)
Future<void> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();

  isar = await Isar.open(
    [
      UserSchema, // ← Schéma User
      MembreSchema, // ← Schéma Membre
      NotificationModelSchema, // ✅ AJOUTEZ CETTE LIGNE
    ],
    directory: dir.path,
    inspector: true,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initIsar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groupe Samuel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF66BB6A)),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
