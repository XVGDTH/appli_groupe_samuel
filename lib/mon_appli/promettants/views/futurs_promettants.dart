import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:groupe_samuel_appli/services/membre_service.dart';
import 'package:groupe_samuel_appli/services/notification_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

class PromettantsPage extends StatefulWidget {
  const PromettantsPage({super.key});

  @override
  State<PromettantsPage> createState() => _PromettantsPageState();
}

class _PromettantsPageState extends State<PromettantsPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  final GlobalKey _cardKey = GlobalKey();

  // Variables pour l'image (Web et Mobile)
  Uint8List? _promettantImageBytes;
  File? _promettantImageFile;
  String? _promettantImagePath;
  bool _hasImage = false;

  // Controllers
  final _responsableController = TextEditingController();
  final _contactResponsableController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _ageController = TextEditingController();
  final _classeController = TextEditingController();
  final _personneUrgenteController = TextEditingController();
  final _contactUrgenteController = TextEditingController();
  final _adresseController = TextEditingController();
  final _lieuNaissanceController = TextEditingController();
  final _dateNaissanceController = TextEditingController();
  final _groupeSanguinController = TextEditingController();
  final _allergiesController = TextEditingController();

  String _typeResponsable = 'Dirigeant';
  String _sexe = 'Masculin';

  // Animations
  late AnimationController _pulseController;
  late AnimationController _rotateController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotateAnimation;

  // Liste des promettants
  List<Map<String, dynamic>> _promettantsList = [];

  @override
  void initState() {
    super.initState();
    // Animation pulsation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    // Animation rotation
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);
    _rotateAnimation = Tween<double>(begin: -0.03, end: 0.03).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );

    // Charge les Futurs Aînés depuis Isar au démarrage
    _loadAines();

    // Animation pulsation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Animation rotation
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _rotateAnimation = Tween<double>(begin: -0.03, end: 0.03).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.easeInOut),
    );
  }

  // Future<void> _loadAines() async {
  //   final aines = await MembreService.getAllByCategorie(
  //     'Aine',
  //   ); // ← 'Aine' pour les Futurs Aînés

  //   setState(() {
  //     _promettantsList = aines
  //         .map(
  //           (m) => {
  //             'responsable': m.nomResponsable,
  //             'typeResponsable': m.typeResponsable,
  //             'contactResponsable': m.contactResponsable,
  //             'nom': m.nom,
  //             'prenom': m.prenom,
  //             'age': m.age,
  //             'sexe': m.sexe,
  //             'classe': m.classe,
  //             'personneUrgente': m.personneUrgence,
  //             'contactUrgente': m.contactUrgente,
  //             'adresse': m.adresse,
  //             'lieuNaissance': m.lieuNaissance,
  //             'dateNaissance': m.dateNaissance,
  //             'imageBytes': m.photoBytes,
  //             'hasImage': m.photoBytes != null,
  //           },
  //         )
  //         .toList();
  //   });
  // }
  Future<void> _loadAines() async {
    final aine = await MembreService.getAllByCategorie('Promettant');

    setState(() {
      _promettantsList = aine
          .map(
            (m) => {
              'responsable': m.nomResponsable,
              'typeResponsable': m.typeResponsable,
              'contactResponsable': m.contactResponsable,
              'nom': m.nom,
              'prenom': m.prenom,
              'age': m.age,
              'sexe': m.sexe,
              'classe': m.classe,
              'personneUrgente': m.personneUrgence,
              'contactUrgente': m.contactUrgente,
              'adresse': m.adresse,
              'lieuNaissance': m.lieuNaissance,
              'dateNaissance': m.dateNaissance,
              'imageBytes': m.photoBytesAsUint8List, // ✅ Utilise le getter
              'hasImage': m.photoBytes != null,
            },
          )
          .toList();
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotateController.dispose();
    _responsableController.dispose();
    _contactResponsableController.dispose();
    _nomController.dispose();
    _prenomController.dispose();
    _ageController.dispose();
    _classeController.dispose();
    _personneUrgenteController.dispose();
    _contactUrgenteController.dispose();
    _adresseController.dispose();
    _lieuNaissanceController.dispose();
    _dateNaissanceController.dispose();
    _groupeSanguinController.dispose();
    _allergiesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _promettantImageBytes = bytes;
            _promettantImagePath = image.path;
            _hasImage = true;
          });
        } else {
          setState(() {
            _promettantImageFile = File(image.path);
            _promettantImagePath = image.path;
            _hasImage = true;
          });
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo ajoutée avec succès !'),
            backgroundColor: Color(0xFF66BB6A),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur lors de la sélection: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Future<void> _downloadCard(BuildContext context, GlobalKey cardKey) async {
  //   try {
  //     // Vérifier si on a la permission (GAL gère automatiquement les permissions)
  //     if (!kIsWeb) {
  //       final hasAccess = await Gal.hasAccess();
  //       if (!hasAccess) {
  //         final requestGranted = await Gal.requestAccess();
  //         if (!requestGranted) {
  //           throw 'Permission refusée pour accéder à la galerie';
  //         }
  //       }
  //     }

  //     await Future.delayed(const Duration(milliseconds: 100));

  //     // Capturer l'image de la carte
  //     RenderRepaintBoundary boundary =
  //         cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  //     ByteData? byteData = await image.toByteData(
  //       format: ui.ImageByteFormat.png,
  //     );
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();

  //     if (kIsWeb) {
  //       // Pour le web
  //       final blob = html.Blob([pngBytes]);
  //       final url = html.Url.createObjectUrlFromBlob(blob);
  //       final anchor = html.AnchorElement(href: url)
  //         ..setAttribute(
  //           'download',
  //           'carte_promettant_${DateTime.now().millisecondsSinceEpoch}.png',
  //         )
  //         ..click();
  //       html.Url.revokeObjectUrl(url);
  //     } else {
  //       // Pour mobile (Android/iOS)
  //       final tempDir = await getTemporaryDirectory();
  //       final fileName =
  //           'carte_promettant_${DateTime.now().millisecondsSinceEpoch}.png';
  //       final file = File('${tempDir.path}/$fileName');
  //       await file.writeAsBytes(pngBytes);

  //       // Sauvegarder dans la galerie
  //       await Gal.putImage(file.path, album: 'Groupe Samuel');

  //       // Supprimer le fichier temporaire
  //       await file.delete();
  //     }

  //     if (!context.mounted) return;

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('✅ Carte enregistrée dans la galerie avec succès !'),
  //         backgroundColor: Color(0xFF66BB6A),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   } catch (e) {
  //     if (!context.mounted) return;

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('❌ Erreur: ${e.toString()}'),
  //         backgroundColor: Colors.red,
  //         duration: const Duration(seconds: 4),
  //       ),
  //     );
  //   }
  // }

  Future<void> _downloadCard(BuildContext context, GlobalKey cardKey) async {
    try {
      // ✅ Vérifier les permissions avec GAL (pas permission_handler)
      if (!kIsWeb) {
        final hasAccess = await Gal.hasAccess();
        if (!hasAccess) {
          final requestGranted = await Gal.requestAccess();
          if (!requestGranted) {
            throw 'Permission refusée pour accéder à la galerie';
          }
        }
      }

      // ✅ Délai pour assurer le rendu complet
      await Future.delayed(const Duration(milliseconds: 100));

      // ✅ Capturer l'image de la carte
      RenderRepaintBoundary boundary =
          cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      if (kIsWeb) {
        // ✅ Pour le web
        final blob = html.Blob([pngBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute(
            'download',
            'carte_ainé_${DateTime.now().millisecondsSinceEpoch}.png',
          )
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // ✅ Pour mobile (Android/iOS) - UTILISER GAL
        final tempDir = await getTemporaryDirectory();
        final fileName =
            'carte_ainé_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(pngBytes);

        // ✅ Sauvegarder dans la galerie avec GAL
        await Gal.putImage(file.path, album: 'Groupe Samuel');

        // ✅ Supprimer le fichier temporaire
        await file.delete();
      }

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Carte enregistrée dans la galerie avec succès !'),
          backgroundColor: Color(0xFF66BB6A),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Erreur: ${e.toString()}'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  void _showImageOptionsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF66BB6A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Options Photo',
          style: TextStyle(
            color: Color(0xFFFFEB3B),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (kIsWeb)
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Color(0xFFFFEB3B),
                ),
                title: const Text(
                  'Choisir depuis la galerie',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              )
            else ...[
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Color(0xFFFFEB3B)),
                title: const Text(
                  'Prendre une photo',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color: Color(0xFFFFEB3B),
                ),
                title: const Text(
                  'Galerie',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
            if (_hasImage)
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Supprimer la photo',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() {
                    _promettantImageBytes = null;
                    _promettantImageFile = null;
                    _promettantImagePath = null;
                    _hasImage = false;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Photo supprimée'),
                      backgroundColor: Color(0xFFFF9800),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _savePromettant() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Sauvegarde dans Isar
        await MembreService.saveMembre(
          categorie: 'Promettant',
          typeResponsable: _typeResponsable,
          nomResponsable: _responsableController.text.trim(),
          contactResponsable: _contactResponsableController.text.trim(),
          photoBytes: _promettantImageBytes,
          nom: _nomController.text.trim(),
          prenom: _prenomController.text.trim(),
          age: _ageController.text.trim(),
          sexe: _sexe,
          classe: _classeController.text.trim(),
          dateNaissance: _dateNaissanceController.text.trim(),
          lieuNaissance: _lieuNaissanceController.text.trim(),
          adresse: _adresseController.text.trim(),
          personneUrgence: _personneUrgenteController.text.trim(),
          contactUrgence: _contactUrgenteController.text.trim(),
        );

        // ✅ CRÉER UNE NOTIFICATION
        await NotificationService.creerNotification(
          categorie: 'Débutant',
          nom: _nomController.text.trim(),
          prenom: _prenomController.text.trim(),
          age: _ageController.text.trim(),
          classe: _classeController.text.trim(),
          sexe: _sexe,
          nomResponsable: _responsableController.text.trim(),
          contactResponsable: _contactResponsableController.text.trim(),
          typeResponsable: _typeResponsable,
          contactUrgence: _contactUrgenteController.text.trim(),
          personneUrgence: _personneUrgenteController.text.trim(),
          photoBytes: _promettantImageBytes,
        );

        // ✅ RECHARGE LA LISTE DEPUIS LA BD
        await _loadAines();

        // Réinitialisation des champs
        _formKey.currentState!.reset();
        _responsableController.clear();
        _contactResponsableController.clear();
        _nomController.clear();
        _prenomController.clear();
        _ageController.clear();
        _classeController.clear();
        _personneUrgenteController.clear();
        _contactUrgenteController.clear();
        _adresseController.clear();
        _lieuNaissanceController.clear();
        _dateNaissanceController.clear();
        _groupeSanguinController.clear();
        _allergiesController.clear();

        setState(() {
          _promettantImageBytes = null;
          _promettantImageFile = null;
          _promettantImagePath = null;
          _hasImage = false;
          _typeResponsable = 'Dirigeant';
          _sexe = 'Masculin';
        });

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Débutant enregistré avec succès !'),
            backgroundColor: Color(0xFF66BB6A),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      } catch (e) {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Erreur d\'enregistrement: ${e.toString()}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    _buildRegistrationForm(screenWidth, screenHeight),
                    SizedBox(height: screenHeight * 0.03),
                    if (_promettantsList.isNotEmpty)
                      _buildPromettantsList(screenWidth, screenHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo animé
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Transform.rotate(
                      angle: _rotateAnimation.value,
                      child: Container(
                        width: screenWidth * 0.15,
                        height: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFFFEB3B),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFEB3B).withOpacity(0.7),
                              blurRadius: 25,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.stars,
                                  color: Color(0xFF66BB6A),
                                  size: 30,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(width: screenWidth * 0.02),

              // Titre - COMPLÈTEMENT CORRIGÉ
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // GROUPE SAMUEL
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'GROUPE SAMUEL',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFFFFEB3B),
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.008),

                    // Badge FUTURS PROMETTANTS - CORRIGÉ
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFEB3B).withOpacity(0.6),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.stars,
                            color: const Color(0xFF66BB6A),
                            size: screenWidth * 0.04,
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'FUTURS PROMETTANTS',
                                maxLines: 1,
                                style: TextStyle(
                                  color: const Color(0xFF66BB6A),
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: screenWidth * 0.02),

              // Icône utilisateur
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFEB3B), Color(0xFFFFC107)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFEB3B).withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF66BB6A),
                  size: screenWidth * 0.08,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Devise du bas - CORRIGÉ
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Color(0xFFD32F2F), size: 16),
              SizedBox(width: screenWidth * 0.02),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Prêt pour Servir avec Joie, avec Vérité',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.03,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRegistrationForm(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF66BB6A).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ TITRE CORRIGÉ
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.app_registration,
                      color: Colors.white,
                      size: screenWidth * 0.05,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'FORMULAIRE D\'ENREGISTREMENT',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.038,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSectionTitle('👤 Informations du Responsable', screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildDropdownField(
              'Type de Responsable',
              Icons.supervisor_account,
              ['Dirigeant', 'Aîné'],
              _typeResponsable,
              (value) => setState(() => _typeResponsable = value!),
            ),
            _buildTextField(
              'Nom du Responsable',
              Icons.person_outline,
              _responsableController,
              'Entrez le nom complet',
            ),
            _buildTextField(
              'Contact du Responsable',
              Icons.phone,
              _contactResponsableController,
              'Ex: +226 XX XX XX XX',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSectionTitle('⭐ Informations du debutant', screenWidth),
            SizedBox(height: screenHeight * 0.02),
            // Photo (OPTIONNELLE)
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showImageOptionsDialog,
                    child: Container(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _hasImage
                              ? const Color(0xFF66BB6A)
                              : Colors.grey[400]!,
                          width: 3,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF66BB6A).withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: _hasImage
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: _buildImageDisplay(screenWidth),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_photo_alternate,
                                  size: screenWidth * 0.15,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Photo (Optionnelle)',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Cliquez pour ajouter',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '* Photo optionnelle',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.03,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildTextField(
              'Nom',
              Icons.person,
              _nomController,
              'Nom de famille',
            ),
            _buildTextField(
              'Prénom',
              Icons.person_pin,
              _prenomController,
              'Prénom(s)',
            ),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Âge',
                    Icons.cake,
                    _ageController,
                    'Ex: 12',
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: _buildDropdownField(
                    'Sexe',
                    Icons.wc,
                    ['Masculin', 'Féminin'],
                    _sexe,
                    (value) => setState(() => _sexe = value!),
                  ),
                ),
              ],
            ),
            _buildTextField(
              'Classe',
              Icons.school,
              _classeController,
              'Ex: 5ème',
            ),
            _buildTextField(
              'Date de Naissance',
              Icons.calendar_today,
              _dateNaissanceController,
              'JJ/MM/AAAA',
            ),
            _buildTextField(
              'Lieu de Naissance',
              Icons.location_on,
              _lieuNaissanceController,
              'Ville/Village',
            ),
            _buildTextField(
              'Adresse',
              Icons.home,
              _adresseController,
              'Adresse complète',
              maxLines: 2,
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSectionTitle('🚨 Contact d\'Urgence', screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildTextField(
              'Personne à Prévenir',
              Icons.contact_emergency,
              _personneUrgenteController,
              'Nom complet',
            ),
            _buildTextField(
              'Contact d\'Urgence',
              Icons.phone_in_talk,
              _contactUrgenteController,
              'Numéro de téléphone',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: screenHeight * 0.04),
            // ✅ BOUTON ENREGISTRER CORRIGÉ
            Center(
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF66BB6A).withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: _savePromettant,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'ENREGISTRER LE DEBUTANT',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageDisplay(double screenWidth) {
    if (kIsWeb && _promettantImageBytes != null) {
      return Image.memory(
        _promettantImageBytes!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else if (!kIsWeb && _promettantImageFile != null) {
      return Image.file(
        _promettantImageFile!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return Icon(
      Icons.add_photo_alternate,
      size: screenWidth * 0.15,
      color: Colors.grey[400],
    );
  }

  Widget _buildSectionTitle(String title, double screenWidth) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 25,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF66BB6A),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    IconData icon,
    TextEditingController controller,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isRequired = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: isRequired ? label : '$label (optionnel)',
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF66BB6A)),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF66BB6A), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF66BB6A)),
        ),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'Ce champ est requis';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    IconData icon,
    List<String> items,
    String currentValue,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        initialValue: currentValue,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF66BB6A)),
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF66BB6A), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF66BB6A)),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildPromettantsList(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF66BB6A).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('📋 Liste des Promettants', screenWidth),
          SizedBox(height: screenHeight * 0.02),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _promettantsList.length,
            itemBuilder: (context, index) {
              final promettant = _promettantsList[index];
              return _buildPromettantCard(
                promettant,
                screenWidth,
                screenHeight,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPromettantCard(
    Map<String, dynamic> promettant,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF66BB6A).withOpacity(0.15),
            const Color(0xFF4CAF50).withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF66BB6A), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF66BB6A).withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PromettantDetailPage(promettant: promettant),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  // width: screenWidth * 0.15,
                  // height: screenWidth * 0.15,
                  width: screenWidth * 0.18,
                  height: screenWidth * 0.22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF66BB6A),
                      width: 2,
                    ),
                    gradient: promettant['hasImage'] != true
                        ? const LinearGradient(
                            colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                          )
                        : null,
                  ),
                  child: ClipOval(child: _buildListImage(promettant)),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${promettant['prenom']} ${promettant['nom']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF66BB6A),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.cake, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 5),
                          Text(
                            '${promettant['age']} ans',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 15),
                          Icon(Icons.school, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 5),
                          Text(
                            promettant['classe'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios, color: Color(0xFF66BB6A)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildListImage(Map<String, dynamic> promettant) {
  //   if (kIsWeb && promettant['imageBytes'] != null) {
  //     return Image.memory(promettant['imageBytes'], fit: BoxFit.cover);
  //   } else if (!kIsWeb && promettant['imageFile'] != null) {
  //     return Image.file(promettant['imageFile'], fit: BoxFit.cover);
  //   }
  //   return const Icon(Icons.stars, color: Colors.white, size: 30);
  // }
  Widget _buildListImage(Map<String, dynamic> promettant) {
    // La photo est déjà en Uint8List grâce au getter
    if (promettant['imageBytes'] != null) {
      return Image.memory(
        promettant['imageBytes'],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return const Icon(Icons.stars, color: Colors.white, size: 30);
  }
}

// Page de détails
class PromettantDetailPage extends StatelessWidget {
  final Map<String, dynamic> promettant;
  final GlobalKey _cardKey = GlobalKey();

  PromettantDetailPage({super.key, required this.promettant});

  Future<void> _downloadCard(BuildContext context, GlobalKey cardKey) async {
    try {
      // if (!kIsWeb) {
      //   final status = await Permission.storage.request();
      //   if (!status.isGranted) {
      //     throw 'Permission refusée';
      //   }
      // }
      if (!kIsWeb) {
        final hasAccess = await Gal.hasAccess();
        if (!hasAccess) {
          final requestGranted = await Gal.requestAccess();
          if (!requestGranted) {
            throw 'Permission refusée pour accéder à la galerie';
          }
        }
      }

      await Future.delayed(const Duration(milliseconds: 100));

      RenderRepaintBoundary boundary =
          cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      if (kIsWeb) {
        final blob = html.Blob([pngBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute(
            'download',
            'carte_futur_promettant_${DateTime.now().millisecondsSinceEpoch}.png',
          )
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // final directory = await getExternalStorageDirectory();
        // final path =
        //     '/storage/emulated/0/Download/carte_promettant_${DateTime.now().millisecondsSinceEpoch}.png';
        // await File(path).writeAsBytes(pngBytes);
        final tempDir = await getTemporaryDirectory();
        final fileName =
            'carte_futur_promettant_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(pngBytes);

        await Gal.putImage(file.path, album: 'Groupe Samuel');
        await file.delete();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Carte téléchargée avec succès !'),
          backgroundColor: Color(0xFF66BB6A),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Erreur: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Détails du Promettant'),
        backgroundColor: const Color(0xFF66BB6A),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            _buildIDCard(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _buildDownloadButton(context, screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
            _buildDetailsSection(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildIDCard(double screenWidth, double screenHeight) {
    return RepaintBoundary(
      // ✅ CHANGÉ ICI
      key: _cardKey, // ✅ AJOUTÉ ICI
      child: Container(
        // ✅ CHANGÉ ICI (avant c'était juste "return Container")
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF66BB6A), width: 3),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF66BB6A).withOpacity(0.4),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              // ... le reste continue normalement
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'CARTE FUTUR PROMETTANT',
                    style: TextStyle(
                      color: const Color(0xFFFFEB3B),
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'GROUPE SAMUEL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Archidiocèse de Bobo-Dioulasso',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    ' chapelle SAINT PAUL de Ouezzin ville',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.032,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFF66BB6A),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.stars,
                                color: Color(0xFF66BB6A),
                                size: 50,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCardInfo(
                              'Nom:',
                              promettant['nom'].toString().toUpperCase(),
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'Prénom:',
                              promettant['prenom'],
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'Né(e) le:',
                              promettant['dateNaissance'],
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'À:',
                              promettant['lieuNaissance'],
                              screenWidth,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFFFFEB3B),
                            width: 2,
                          ),
                          gradient: promettant['hasImage'] != true
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF66BB6A),
                                    Color(0xFF4CAF50),
                                  ],
                                )
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: _buildDetailImage(promettant),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _buildCardInfo(
                                'Classe:',
                                promettant['classe'],
                                screenWidth,
                              ),
                            ),
                            Expanded(
                              child: _buildCardInfo(
                                'Âge:',
                                '${promettant['age']} ans',
                                screenWidth,
                              ),
                            ),
                          ],
                        ),

                        // nouvelle fonctionalité
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              _buildCardInfo(
                                'Responsable:',
                                '${promettant['typeResponsable']} - ${promettant['responsable']}',
                                screenWidth,
                              ),
                              const SizedBox(height: 5),
                              _buildCardInfo(
                                'Contact:',
                                promettant['contactResponsable'],
                                screenWidth,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // _buildCardInfo(
                        //   'Adresse:',
                        //   promettant['adresse'],
                        //   screenWidth,
                        // ),
                        if (promettant['groupeSanguin'] != null &&
                            promettant['groupeSanguin']
                                .toString()
                                .isNotEmpty) ...[
                          const SizedBox(height: 10),
                          _buildCardInfo(
                            'Groupe Sanguin:',
                            promettant['groupeSanguin'],
                            screenWidth,
                            isImportant: true,
                          ),
                        ],
                        const Divider(color: Color(0xFF66BB6A)),
                        // _buildCardInfo(
                        //   'Contact urgence:',
                        //   promettant['contactUrgente'],
                        //   screenWidth,
                        //   isEmergency: true,
                        // ),
                        _buildCardInfo(
                          'Personne urgence:',
                          promettant['personneUrgente'],
                          screenWidth,
                        ),
                        const SizedBox(height: 5),
                        _buildCardInfo(
                          'Contact urgence:',
                          promettant['contactUrgente'],
                          screenWidth,
                          isEmergency: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF66BB6A).withOpacity(0.2),
                          Color(0xFF4CAF50).withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: Color(0xFFD32F2F),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Prêt pour Servir avec Joie, avec Vérité',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF66BB6A),
                              fontSize: screenWidth * 0.03,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildDetailImage(Map<String, dynamic> promettant) {
  //   if (kIsWeb && promettant['imageBytes'] != null) {
  //     return Image.memory(promettant['imageBytes'], fit: BoxFit.cover);
  //   } else if (!kIsWeb && promettant['imageFile'] != null) {
  //     return Image.file(promettant['imageFile'], fit: BoxFit.cover);
  //   }
  //   return const Icon(Icons.stars, color: Colors.white, size: 50);
  // }
  Widget _buildDetailImage(Map<String, dynamic> promettant) {
    if (promettant['imageBytes'] != null) {
      return Image.memory(
        promettant['imageBytes'],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    return const Icon(Icons.stars, color: Colors.white, size: 50);
  }

  Widget _buildCardInfo(
    String label,
    String value,
    double screenWidth, {
    bool isEmergency = false,
    bool isImportant = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.032,
            fontWeight: FontWeight.bold,
            color: isEmergency
                ? const Color(0xFFD32F2F)
                : isImportant
                ? const Color(0xFFFF9800)
                : const Color(0xFF66BB6A),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.032,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadButton(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF9800).withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => _downloadCard(context, _cardKey),
            // onTap: () {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Téléchargement de la carte en cours...'),
            //       backgroundColor: Color(0xFF66BB6A),
            //     ),
            //   );
            // },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.download, color: Colors.white, size: 28),
                const SizedBox(width: 10),
                Text(
                  'TÉLÉCHARGER LA CARTE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSection(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF66BB6A).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF66BB6A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                'DÉTAILS COMPLETS',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF66BB6A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF66BB6A), thickness: 2),
          const SizedBox(height: 20),
          _buildSection('👤 RESPONSABLE', [
            {'label': 'Type', 'value': promettant['typeResponsable']},
            {'label': 'Nom', 'value': promettant['responsable']},
            {'label': 'Contact', 'value': promettant['contactResponsable']},
          ], screenWidth),
          const SizedBox(height: 20),
          _buildSection('⭐ IDENTITÉ', [
            {
              'label': 'Nom complet',
              'value': '${promettant['prenom']} ${promettant['nom']}',
            },
            {'label': 'Sexe', 'value': promettant['sexe']},
            {
              'label': 'Date de naissance',
              'value': promettant['dateNaissance'],
            },
            {
              'label': 'Lieu de naissance',
              'value': promettant['lieuNaissance'],
            },
            {'label': 'Âge', 'value': '${promettant['age']} ans'},
            {'label': 'Classe', 'value': promettant['classe']},
            {'label': 'Adresse', 'value': promettant['adresse']},
          ], screenWidth),
          if (promettant['groupeSanguin']?.toString().isNotEmpty == true ||
              promettant['allergies']?.toString().isNotEmpty == true) ...[
            const SizedBox(height: 20),
            _buildSection(
              '🏥 INFORMATIONS MÉDICALES',
              [
                if (promettant['groupeSanguin']?.toString().isNotEmpty == true)
                  {
                    'label': 'Groupe Sanguin',
                    'value': promettant['groupeSanguin'],
                  },
                if (promettant['allergies']?.toString().isNotEmpty == true)
                  {'label': 'Allergies', 'value': promettant['allergies']},
              ],
              screenWidth,
              isImportant: true,
            ),
          ],
          const SizedBox(height: 20),
          _buildSection(
            '🚨 CONTACT D\'URGENCE',
            [
              {
                'label': 'Personne à prévenir',
                'value': promettant['personneUrgente'],
              },
              {'label': 'Téléphone', 'value': promettant['contactUrgente']},
            ],
            screenWidth,
            isEmergency: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<Map<String, String>> details,
    double screenWidth, {
    bool isEmergency = false,
    bool isImportant = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isEmergency
            ? const Color(0xFFFFEBEE)
            : isImportant
            ? const Color(0xFFFFF3E0)
            : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isEmergency
              ? const Color(0xFFD32F2F).withOpacity(0.3)
              : isImportant
              ? const Color(0xFFFF9800).withOpacity(0.3)
              : const Color(0xFF66BB6A).withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: isEmergency
                  ? const Color(0xFFD32F2F)
                  : isImportant
                  ? const Color(0xFFFF9800)
                  : const Color(0xFF66BB6A),
            ),
          ),
          const SizedBox(height: 15),
          ...details.map((detail) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * 0.35,
                    child: Text(
                      '${detail['label']}:',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      detail['value']!,
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
