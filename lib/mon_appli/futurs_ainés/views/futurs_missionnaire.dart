import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class FutursAinesPage extends StatefulWidget {
  const FutursAinesPage({super.key});

  @override
  State<FutursAinesPage> createState() => _FutursAinesPageState();
}

class _FutursAinesPageState extends State<FutursAinesPage>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

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
  final List<Map<String, dynamic>> _promettantsList = [];

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

  void _savePromettant() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _promettantsList.add({
          'responsable': _responsableController.text,
          'typeResponsable': _typeResponsable,
          'contactResponsable': _contactResponsableController.text,
          'nom': _nomController.text,
          'prenom': _prenomController.text,
          'age': _ageController.text,
          'sexe': _sexe,
          'classe': _classeController.text,
          'personneUrgente': _personneUrgenteController.text,
          'contactUrgente': _contactUrgenteController.text,
          'adresse': _adresseController.text,
          'lieuNaissance': _lieuNaissanceController.text,
          'dateNaissance': _dateNaissanceController.text,
          'groupeSanguin': _groupeSanguinController.text,
          'allergies': _allergiesController.text,
          'imageBytes': _promettantImageBytes,
          'imageFile': _promettantImageFile,
          'imagePath': _promettantImagePath,
          'hasImage': _hasImage,
        });
      });
      // Réinitialisation
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Promettant enregistré avec succès !'),
            ],
          ),
          backgroundColor: const Color(0xFF66BB6A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
              // Titre
              Column(
                children: [
                  Text(
                    'GROUPE SAMUEL',
                    style: TextStyle(
                      color: const Color(0xFFFFEB3B),
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
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
                        const Icon(
                          Icons.stars,
                          color: Color(0xFF66BB6A),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Futurs Missionnaires',
                          style: TextStyle(
                            color: const Color(0xFF66BB6A),
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite, color: Color(0xFFD32F2F), size: 16),
              const SizedBox(width: 8),
              Text(
                'Prêt pour Servir avec Joie, avec Vérité',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.032,
                  fontStyle: FontStyle.italic,
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
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
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
                    const Icon(Icons.app_registration, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'FORMULAIRE D\'ENREGISTREMENT',
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
            _buildSectionTitle('⭐ Informations du Promettant', screenWidth),
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
            // SizedBox(height: screenHeight * 0.03),
            // _buildSectionTitle('🏥 Informations Médicales', screenWidth),
            // SizedBox(height: screenHeight * 0.02),
            // _buildTextField(
            //   'Groupe Sanguin',
            //   Icons.bloodtype,
            //   _groupeSanguinController,
            //   'Ex: O+, A-, B+...',
            //   isRequired: false,
            // ),
            // _buildTextField(
            //   'Allergies',
            //   Icons.health_and_safety,
            //   _allergiesController,
            //   'Mentionner les allergies (optionnel)',
            //   maxLines: 2,
            //   isRequired: false,
            // ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        Text(
                          'ENREGISTRER LE PROMETTANT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
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
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
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

  Widget _buildListImage(Map<String, dynamic> promettant) {
    if (kIsWeb && promettant['imageBytes'] != null) {
      return Image.memory(promettant['imageBytes'], fit: BoxFit.cover);
    } else if (!kIsWeb && promettant['imageFile'] != null) {
      return Image.file(promettant['imageFile'], fit: BoxFit.cover);
    }
    return const Icon(Icons.stars, color: Colors.white, size: 30);
  }
}

// Page de détails
class PromettantDetailPage extends StatelessWidget {
  final Map<String, dynamic> promettant;
  const PromettantDetailPage({super.key, required this.promettant});

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
    return Container(
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
                  'CARTE PROMETTANT',
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
                                colors: [Color(0xFF66BB6A), Color(0xFF4CAF50)],
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
                      const SizedBox(height: 10),
                      _buildCardInfo(
                        'Adresse:',
                        promettant['adresse'],
                        screenWidth,
                      ),
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
    );
  }

  Widget _buildDetailImage(Map<String, dynamic> promettant) {
    if (kIsWeb && promettant['imageBytes'] != null) {
      return Image.memory(promettant['imageBytes'], fit: BoxFit.cover);
    } else if (!kIsWeb && promettant['imageFile'] != null) {
      return Image.file(promettant['imageFile'], fit: BoxFit.cover);
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
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Téléchargement de la carte en cours...'),
                  backgroundColor: Color(0xFF66BB6A),
                ),
              );
            },
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
