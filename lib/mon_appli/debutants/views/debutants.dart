// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'dart:typed_data'; // Pour Uint8List
// import 'dart:io'; // Pour File (mobile)
// import 'package:flutter/foundation.dart'; // Pour kIsWeb

// class DebutantsPage extends StatefulWidget {
//   const DebutantsPage({super.key});

//   @override
//   State<DebutantsPage> createState() => _DebutantsPageState();
// }

// class _DebutantsPageState extends State<DebutantsPage> with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//    final ImagePicker _picker = ImagePicker();
//     Uint8List? _debutantImageBytes; // Pour Web
//   File? _debutantImageFile; // Pour mobile
//   String? _debutantImagePath; // Pour stocker le chemin/URL

//   // Controllers
//   final _responsableController = TextEditingController();
//   final _contactResponsableController = TextEditingController();
//   final _nomController = TextEditingController();
//   final _prenomController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _classeController = TextEditingController();
//   final _personneUrgenteController = TextEditingController();
//   final _contactUrgenteController = TextEditingController();
//   final _adresseController = TextEditingController();
//   final _lieuNaissanceController = TextEditingController();
//   final _dateNaissanceController = TextEditingController();

//   File? _debutantImage;
//   String _typeResponsable = 'Dirigeant';
//   late AnimationController _animationController;
//   late Animation<double> _pulseAnimation;

//   // Liste des débutants enregistrés
//   List<Map<String, dynamic>> _debutantsList = [];

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     )..repeat(reverse: true);

//     _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _responsableController.dispose();
//     _contactResponsableController.dispose();
//     _nomController.dispose();
//     _prenomController.dispose();
//     _ageController.dispose();
//     _classeController.dispose();
//     _personneUrgenteController.dispose();
//     _contactUrgenteController.dispose();
//     _adresseController.dispose();
//     _lieuNaissanceController.dispose();
//     _dateNaissanceController.dispose();
//     super.dispose();
//   }

//   // Future<void> _pickImage(ImageSource source) async {
//   //   final XFile? image = await _picker.pickImage(source: source);
//   //   if (image != null) {
//   //     setState(() {
//   //       _debutantImage = File(image.path);
//   //     });
//   //   }
//   // }
//   Future<void> _pickImage(ImageSource source) async {
//   try {
//     final XFile? image = await _picker.pickImage(
//       source: source,
//       imageQuality: 80, // Réduit la taille
//       maxWidth: 800, // Limite la largeur
//     );

//     if (image != null) {
//       if (kIsWeb) {
//         // Pour le Web
//         final bytes = await image.readAsBytes();
//         setState(() {
//           _debutantImageBytes = bytes;
//           _debutantImagePath = image.path;
//         });
//       } else {
//         // Pour mobile
//         setState(() {
//           _debutantImageFile = File(image.path);
//           _debutantImagePath = image.path;
//         });
//       }
//     }
//   } catch (e) {
//     print("Erreur lors de la sélection d'image: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Erreur: ${e.toString()}'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
// }

//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: const Color(0xFF2E7D32),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text(
//           'Choisir une photo',
//           style: TextStyle(color: Color(0xFFFFEB3B), fontWeight: FontWeight.bold),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera_alt, color: Color(0xFFFFEB3B)),
//               title: const Text('Prendre une photo', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.camera);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library, color: Color(0xFFFFEB3B)),
//               title: const Text('Galerie', style: TextStyle(color: Colors.white)),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.gallery);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _saveDebutant() {
//     if (_formKey.currentState!.validate()) {
//       if (_debutantImage == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Veuillez ajouter une photo du débutant'),
//             backgroundColor: Color(0xFFD32F2F),
//           ),
//         );
//         return;
//       }

//       setState(() {
//         _debutantsList.add({
//           'responsable': _responsableController.text,
//           'typeResponsable': _typeResponsable,
//           'contactResponsable': _contactResponsableController.text,
//           'nom': _nomController.text,
//           'prenom': _prenomController.text,
//           'age': _ageController.text,
//           'classe': _classeController.text,
//           'personneUrgente': _personneUrgenteController.text,
//           'contactUrgente': _contactUrgenteController.text,
//           'adresse': _adresseController.text,
//           'lieuNaissance': _lieuNaissanceController.text,
//           'dateNaissance': _dateNaissanceController.text,
//           'image': _debutantImage,
//            'imageBytes': _debutantImageBytes, // Pour Web
//     'imageFile': _debutantImageFile,   // Pour mobile
//     'imagePath': _debutantImagePath,   // Chemin/URL
//         });
//       });

//       // Réinitialiser le formulaire
//       _formKey.currentState!.reset();
//       _responsableController.clear();
//       _contactResponsableController.clear();
//       _nomController.clear();
//       _prenomController.clear();
//       _ageController.clear();
//       _classeController.clear();
//       _personneUrgenteController.clear();
//       _contactUrgenteController.clear();
//       _adresseController.clear();
//       _lieuNaissanceController.clear();
//       _dateNaissanceController.clear();
//       setState(() {
//         _debutantImage = null;
//         _typeResponsable = 'Dirigeant';
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Débutant enregistré avec succès !'),
//           backgroundColor: Color(0xFF4CAF50),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             _buildHeader(screenWidth, screenHeight),

//             // Corps principal
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: screenHeight * 0.02),

//                     // Formulaire d'enregistrement
//                     _buildRegistrationForm(screenWidth, screenHeight),

//                     SizedBox(height: screenHeight * 0.03),

//                     // Liste des débutants
//                     if (_debutantsList.isNotEmpty)
//                       _buildDebutantsList(screenWidth, screenHeight),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDebutantImage(double width) {
//   if (_debutantImageBytes != null && kIsWeb) {
//     // Pour Web
//     return Image.memory(
//       _debutantImageBytes!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//     );
//   } else if (_debutantImageFile != null && !kIsWeb) {
//     // Pour mobile
//     return Image.file(
//       _debutantImageFile!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//     );
//   } else if (_debutantImagePath != null && kIsWeb) {
//     // Alternative pour Web (si path est une URL)
//     return Image.network(
//       _debutantImagePath!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       errorBuilder: (context, error, stackTrace) {
//         return _buildDefaultImageIcon(width);
//       },
//     );
//   } else {
//     // Image par défaut
//     return _buildDefaultImageIcon(width);
//   }
// }

// Widget _buildDefaultImageIcon(double width) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(
//         Icons.add_a_photo,
//         size: width * 0.15,
//         color: const Color(0xFF4CAF50),
//       ),
//       const SizedBox(height: 10),
//       const Text(
//         'Ajouter une photo',
//         style: TextStyle(
//           color: Color(0xFF2E7D32),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     ],
//   );
// }

//   Widget _buildHeader(double screenWidth, double screenHeight) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: screenWidth * 0.05,
//         vertical: screenHeight * 0.02,
//       ),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Logo animé à gauche
//               AnimatedBuilder(
//                 animation: _pulseAnimation,
//                 builder: (context, child) {
//                   return Transform.scale(
//                     scale: _pulseAnimation.value,
//                     child: Container(
//                       width: screenWidth * 0.15,
//                       height: screenWidth * 0.15,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                         border: Border.all(color: const Color(0xFFD32F2F), width: 3),
//                         boxShadow: [
//                           BoxShadow(
//                             color: const Color(0xFFFFEB3B).withOpacity(0.6),
//                             blurRadius: 20,
//                             spreadRadius: 3,
//                           ),
//                         ],
//                       ),
//                       child: ClipOval(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image.asset(
//                             'assets/images/logo.jpg',
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Icon(
//                                 Icons.church,
//                                 color: Color(0xFF2E7D32),
//                                 size: 30,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               // Titre central
//               Column(
//                 children: [
//                   Text(
//                     'GROUPE SAMUEL',
//                     style: TextStyle(
//                       color: const Color(0xFFFFEB3B),
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2,
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4CAF50),
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF4CAF50).withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       'DÉBUTANTS',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: screenWidth * 0.045,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),

//               // Icône utilisateur à droite
//               Container(
//                 width: screenWidth * 0.15,
//                 height: screenWidth * 0.15,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                   border: Border.all(color: const Color(0xFFFFEB3B), width: 3),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFD32F2F).withOpacity(0.6),
//                       blurRadius: 20,
//                       spreadRadius: 3,
//                     ),
//                   ],
//                 ),
//                 child: Icon(
//                   Icons.person,
//                   color: const Color(0xFF2E7D32),
//                   size: screenWidth * 0.08,
//                 ),
//               ),
//             ],
//           ),

//           SizedBox(height: screenHeight * 0.015),

//           // Devise
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.favorite, color: Color(0xFFD32F2F), size: 16),
//               const SizedBox(width: 8),
//               Text(
//                 'Prêt pour Servir avec Joie, avec Vérité',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: screenWidth * 0.032,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRegistrationForm(double screenWidth, double screenHeight) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       padding: EdgeInsets.all(screenWidth * 0.05),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF2E7D32).withOpacity(0.3),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Titre du formulaire
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(Icons.app_registration, color: Colors.white),
//                     const SizedBox(width: 10),
//                     Text(
//                       'FORMULAIRE D\'ENREGISTREMENT',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: screenWidth * 0.04,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.03),

//             // Section Responsable
//             _buildSectionTitle('👤 Informations du Responsable', screenWidth),
//             SizedBox(height: screenHeight * 0.02),

//             _buildDropdownField(
//               'Type de Responsable',
//               Icons.supervisor_account,
//               ['Dirigeant', 'Aîné'],
//               _typeResponsable,
//               (value) => setState(() => _typeResponsable = value!),
//             ),

//             _buildTextField(
//               'Nom du Responsable',
//               Icons.person_outline,
//               _responsableController,
//               'Entrez le nom complet',
//             ),

//             _buildTextField(
//               'Contact du Responsable',
//               Icons.phone,
//               _contactResponsableController,
//               'Ex: +226 XX XX XX XX',
//               keyboardType: TextInputType.phone,
//             ),

//             SizedBox(height: screenHeight * 0.03),

//             // Section Débutant
//             _buildSectionTitle('🌟 Informations du Débutant', screenWidth),
//             SizedBox(height: screenHeight * 0.02),

//             // Photo du débutant
//             Center(
//               child: GestureDetector(
//                 onTap: _showImageSourceDialog,
//                 child: Container(
//                   width: screenWidth * 0.4,
//                   height: screenWidth * 0.4,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F5F5),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(
//                       color: const Color(0xFF4CAF50),
//                       width: 3,
//                       style: BorderStyle.solid,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: const Color(0xFF4CAF50).withOpacity(0.3),
//                         blurRadius: 15,
//                         spreadRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: _debutantImage != null
//                       ? ClipRRect(
//                           borderRadius: BorderRadius.circular(17),
//                           child: _buildDebutantImage(screenWidth),
//                           // child: Image.file(_debutantImage!, fit: BoxFit.cover),
//                         )
//                       : Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.add_a_photo,
//                               size: screenWidth * 0.15,
//                               color: const Color(0xFF4CAF50),
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               'Ajouter une photo',
//                               style: TextStyle(
//                                 color: Color(0xFF2E7D32),
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.02),

//             _buildTextField(
//               'Nom',
//               Icons.person,
//               _nomController,
//               'Nom de famille',
//             ),

//             _buildTextField(
//               'Prénom',
//               Icons.person_pin,
//               _prenomController,
//               'Prénom(s)',
//             ),

//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(
//                     'Âge',
//                     Icons.cake,
//                     _ageController,
//                     'Ex: 10',
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.03),
//                 Expanded(
//                   child: _buildTextField(
//                     'Classe',
//                     Icons.school,
//                     _classeController,
//                     'Ex: CM2',
//                   ),
//                 ),
//               ],
//             ),

//             _buildTextField(
//               'Date de Naissance',
//               Icons.calendar_today,
//               _dateNaissanceController,
//               'JJ/MM/AAAA',
//             ),

//             _buildTextField(
//               'Lieu de Naissance',
//               Icons.location_on,
//               _lieuNaissanceController,
//               'Ville/Village',
//             ),

//             _buildTextField(
//               'Adresse',
//               Icons.home,
//               _adresseController,
//               'Adresse complète',
//               maxLines: 2,
//             ),

//             SizedBox(height: screenHeight * 0.03),

//             // Section Urgence
//             _buildSectionTitle('🚨 Contact d\'Urgence', screenWidth),
//             SizedBox(height: screenHeight * 0.02),

//             _buildTextField(
//               'Personne à Prévenir',
//               Icons.contact_emergency,
//               _personneUrgenteController,
//               'Nom complet',
//             ),

//             _buildTextField(
//               'Contact d\'Urgence',
//               Icons.phone_in_talk,
//               _contactUrgenteController,
//               'Numéro de téléphone',
//               keyboardType: TextInputType.phone,
//             ),

//             SizedBox(height: screenHeight * 0.04),

//             // Bouton d'enregistrement
//             Center(
//               child: Container(
//                 width: double.infinity,
//                 height: screenHeight * 0.07,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFF4CAF50).withOpacity(0.5),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(30),
//                     onTap: _saveDebutant,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.save, color: Colors.white, size: 28),
//                         const SizedBox(width: 10),
//                         Text(
//                           'ENREGISTRER LE DÉBUTANT',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.04,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title, double screenWidth) {
//     return Row(
//       children: [
//         Container(
//           width: 4,
//           height: 25,
//           decoration: BoxDecoration(
//             color: const Color(0xFF4CAF50),
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ),
//         const SizedBox(width: 10),
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: screenWidth * 0.045,
//             fontWeight: FontWeight.bold,
//             color: const Color(0xFF2E7D32),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTextField(
//     String label,
//     IconData icon,
//     TextEditingController controller,
//     String hint, {
//     TextInputType keyboardType = TextInputType.text,
//     int maxLines = 1,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           labelText: label,
//           hintText: hint,
//           prefixIcon: Icon(icon, color: const Color(0xFF4CAF50)),
//           filled: true,
//           fillColor: const Color(0xFFF5F5F5),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
//           ),
//           labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
//         ),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Ce champ est requis';
//           }
//           return null;
//         },
//       ),
//     );
//   }

//   Widget _buildDropdownField(
//     String label,
//     IconData icon,
//     List<String> items,
//     String currentValue,
//     Function(String?) onChanged,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: DropdownButtonFormField<String>(
//         value: currentValue,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: const Color(0xFF4CAF50)),
//           filled: true,
//           fillColor: const Color(0xFFF5F5F5),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
//           ),
//           labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
//         ),
//         items: items.map((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         onChanged: onChanged,
//       ),
//     );
//   }

//   Widget _buildDebutantsList(double screenWidth, double screenHeight) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       padding: EdgeInsets.all(screenWidth * 0.05),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF2E7D32).withOpacity(0.3),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle('📋 Liste des Débutants', screenWidth),
//           SizedBox(height: screenHeight * 0.02),

//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: _debutantsList.length,
//             itemBuilder: (context, index) {
//               final debutant = _debutantsList[index];
//               return _buildDebutantCard(debutant, screenWidth, screenHeight);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDebutantCard(Map<String, dynamic> debutant, double screenWidth, double screenHeight) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 15),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             const Color(0xFF4CAF50).withOpacity(0.1),
//             const Color(0xFF2E7D32).withOpacity(0.05),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: const Color(0xFF4CAF50), width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF4CAF50).withOpacity(0.2),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DebutantDetailPage(debutant: debutant),
//               ),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Row(
//               children: [
//                 // Photo
//                 Container(
//                   width: screenWidth * 0.15,
//                   height: screenWidth * 0.15,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: const Color(0xFF4CAF50), width: 2),
//                   ),
//                   child: ClipOval(
//                     // child: debutant['image'] != null
//                     //     ? Image.file(debutant['image'], fit: BoxFit.cover)
//                     //     : const Icon(Icons.person, color: Color(0xFF4CAF50)),
//                     child: _buildListDebutantImage(debutant),
//                   ),
//                 ),

//                 SizedBox(width: screenWidth * 0.04),

//                 // Infos
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${debutant['prenom']} ${debutant['nom']}',
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.045,
//                           fontWeight: FontWeight.bold,
//                           color: const Color(0xFF2E7D32),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           Icon(Icons.cake, size: 16, color: Colors.grey[600]),
//                           const SizedBox(width: 5),
//                           Text(
//                             '${debutant['age']} ans',
//                             style: TextStyle(color: Colors.grey[600]),
//                           ),
//                           const SizedBox(width: 15),
//                           Icon(Icons.school, size: 16, color: Colors.grey[600]),
//                           const SizedBox(width: 5),
//                           Text(
//                             debutant['classe'],
//                             style: TextStyle(color: Colors.grey[600]),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 const Icon(Icons.arrow_forward_ios, color: Color(0xFF4CAF50)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Widget _buildListDebutantImage(Map<String, dynamic> debutant) {
//   if (kIsWeb && debutant['imageBytes'] != null) {
//     return Image.memory(
//       debutant['imageBytes'],
//       fit: BoxFit.cover,
//     );
//   } else if (!kIsWeb && debutant['imageFile'] != null) {
//     return Image.file(
//       debutant['imageFile'],
//       fit: BoxFit.cover,
//     );
//   } else if (kIsWeb && debutant['imagePath'] != null) {
//     return Image.network(
//       debutant['imagePath'],
//       fit: BoxFit.cover,
//       errorBuilder: (context, error, stackTrace) {
//         return const Icon(Icons.person, color: Color(0xFF4CAF50));
//       },
//     );
//   } else {
//     return const Icon(Icons.person, color: Color(0xFF4CAF50));
//   }
// }

// // Page de détails du débutant avec génération de carte
// class DebutantDetailPage extends StatelessWidget {
//   final Map<String, dynamic> debutant;

//   const DebutantDetailPage({super.key, required this.debutant});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: const Text('Détails du Débutant'),
//         backgroundColor: const Color(0xFF4CAF50),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: screenHeight * 0.02),

//             // Carte d'identité
//             _buildIDCard(screenWidth, screenHeight),

//             SizedBox(height: screenHeight * 0.03),

//             // Bouton de téléchargement
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//               child: Container(
//                 width: double.infinity,
//                 height: screenHeight * 0.07,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFFD32F2F), Color(0xFFB71C1C)],
//                   ),
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: const Color(0xFFD32F2F).withOpacity(0.5),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(30),
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Téléchargement de la carte en cours...'),
//                           backgroundColor: Color(0xFF4CAF50),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.download, color: Colors.white, size: 28),
//                         const SizedBox(width: 10),
//                         Text(
//                           'TÉLÉCHARGER LA CARTE',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.04,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: screenHeight * 0.03),

//             // Détails complets
//             _buildDetailsSection(screenWidth, screenHeight),

//             SizedBox(height: screenHeight * 0.03),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildIDCard(double screenWidth, double screenHeight) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       width: screenWidth * 0.9,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: const Color(0xFF4CAF50),
//           width: 3,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF2E7D32).withOpacity(0.4),
//             blurRadius: 25,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // En-tête de la carte
//           Container(
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(17),
//                 topRight: Radius.circular(17),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   'CARTE DÉBUTANT',
//                   style: TextStyle(
//                     color: const Color(0xFFFFEB3B),
//                     fontSize: screenWidth * 0.05,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 2,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   'GROUPE SAMUEL',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: screenWidth * 0.045,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 1.5,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   'Archidiocèse de Bobo-Dioulasso',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: screenWidth * 0.032,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Corps de la carte
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 // Section avec photos
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Logo Groupe Samuel à gauche
//                     Container(
//                       width: screenWidth * 0.25,
//                       height: screenWidth * 0.3,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           color: const Color(0xFF4CAF50),
//                           width: 2,
//                         ),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(13),
//                         child: Image.asset(
//                           'assets/images/logo.jpg',
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return const Icon(
//                               Icons.church,
//                               color: Color(0xFF2E7D32),
//                               size: 50,
//                             );
//                           },
//                         ),
//                       ),
//                     ),

//                     const SizedBox(width: 15),

//                     // Informations centrales
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildCardInfoRow(
//                             'Nom:',
//                             debutant['nom'].toString().toUpperCase(),
//                             screenWidth,
//                           ),
//                           const SizedBox(height: 8),
//                           _buildCardInfoRow(
//                             'Prénom:',
//                             debutant['prenom'],
//                             screenWidth,
//                           ),
//                           const SizedBox(height: 8),
//                           _buildCardInfoRow(
//                             'Né(e) le:',
//                             debutant['dateNaissance'],
//                             screenWidth,
//                           ),
//                           const SizedBox(height: 8),
//                           _buildCardInfoRow(
//                             'À:',
//                             debutant['lieuNaissance'],
//                             screenWidth,
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(width: 15),

//                     // Photo du débutant à droite
//                     Container(
//                       width: screenWidth * 0.25,
//                       height: screenWidth * 0.3,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           color: const Color(0xFFD32F2F),
//                           width: 2,
//                         ),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(13),
//                         child: debutant['image'] != null
//                             ? Image.file(
//                                 debutant['image'],
//                                 fit: BoxFit.cover,
//                               )
//                             : const Icon(
//                                 Icons.person,
//                                 color: Color(0xFF4CAF50),
//                                 size: 50,
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 20),

//                 // Autres informations
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF5F5F5),
//                     borderRadius: BorderRadius.circular(15),
//                     border: Border.all(
//                       color: const Color(0xFF4CAF50).withOpacity(0.3),
//                       width: 1,
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildCardInfoRow(
//                               'Classe:',
//                               debutant['classe'],
//                               screenWidth,
//                             ),
//                           ),
//                           Expanded(
//                             child: _buildCardInfoRow(
//                               'Âge:',
//                               '${debutant['age']} ans',
//                               screenWidth,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       _buildCardInfoRow(
//                         'Adresse:',
//                         debutant['adresse'],
//                         screenWidth,
//                       ),
//                       const SizedBox(height: 10),
//                       const Divider(color: Color(0xFF4CAF50)),
//                       const SizedBox(height: 10),
//                       _buildCardInfoRow(
//                         'Contact urgence:',
//                         debutant['contactUrgente'],
//                         screenWidth,
//                         isEmergency: true,
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 15),

//                 // Pied de carte
//                 Container(
//                   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         const Color(0xFF4CAF50).withOpacity(0.2),
//                         const Color(0xFF2E7D32).withOpacity(0.1),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.favorite,
//                         color: Color(0xFFD32F2F),
//                         size: 16,
//                       ),
//                       const SizedBox(width: 8),
//                       Flexible(
//                         child: Text(
//                           'Prêt pour Servir avec Joie, avec Vérité',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: const Color(0xFF2E7D32),
//                             fontSize: screenWidth * 0.03,
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCardInfoRow(String label, String value, double screenWidth, {bool isEmergency = false}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: screenWidth * 0.032,
//             fontWeight: FontWeight.bold,
//             color: isEmergency ? const Color(0xFFD32F2F) : const Color(0xFF2E7D32),
//           ),
//         ),
//         const SizedBox(width: 5),
//         Expanded(
//           child: Text(
//             value,
//             style: TextStyle(
//               fontSize: screenWidth * 0.032,
//               color: Colors.black87,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailsSection(double screenWidth, double screenHeight) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(25),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF2E7D32).withOpacity(0.3),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF4CAF50),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(Icons.info_outline, color: Colors.white, size: 24),
//               ),
//               const SizedBox(width: 15),
//               Text(
//                 'DÉTAILS COMPLETS',
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.045,
//                   fontWeight: FontWeight.bold,
//                   color: const Color(0xFF2E7D32),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 20),
//           const Divider(color: Color(0xFF4CAF50), thickness: 2),
//           const SizedBox(height: 20),

//           // Responsable
//           _buildDetailSection(
//             '👤 RESPONSABLE',
//             [
//               {'label': 'Type', 'value': debutant['typeResponsable']},
//               {'label': 'Nom', 'value': debutant['responsable']},
//               {'label': 'Contact', 'value': debutant['contactResponsable']},
//             ],
//             screenWidth,
//           ),

//           const SizedBox(height: 20),

//           // Identité complète
//           _buildDetailSection(
//             '🌟 IDENTITÉ COMPLÈTE',
//             [
//               {'label': 'Nom complet', 'value': '${debutant['prenom']} ${debutant['nom']}'},
//               {'label': 'Date de naissance', 'value': debutant['dateNaissance']},
//               {'label': 'Lieu de naissance', 'value': debutant['lieuNaissance']},
//               {'label': 'Âge', 'value': '${debutant['age']} ans'},
//               {'label': 'Classe', 'value': debutant['classe']},
//               {'label': 'Adresse', 'value': debutant['adresse']},
//             ],
//             screenWidth,
//           ),

//           const SizedBox(height: 20),

//           // Contact d'urgence
//           _buildDetailSection(
//             '🚨 CONTACT D\'URGENCE',
//             [
//               {'label': 'Personne à prévenir', 'value': debutant['personneUrgente']},
//               {'label': 'Téléphone', 'value': debutant['contactUrgente']},
//             ],
//             screenWidth,
//             isEmergency: true,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailSection(
//     String title,
//     List<Map<String, String>> details,
//     double screenWidth, {
//     bool isEmergency = false,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: isEmergency
//             ? const Color(0xFFFFEBEE)
//             : const Color(0xFFF5F5F5),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: isEmergency
//               ? const Color(0xFFD32F2F).withOpacity(0.3)
//               : const Color(0xFF4CAF50).withOpacity(0.3),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: screenWidth * 0.04,
//               fontWeight: FontWeight.bold,
//               color: isEmergency ? const Color(0xFFD32F2F) : const Color(0xFF2E7D32),
//             ),
//           ),
//           const SizedBox(height: 15),
//           ...details.map((detail) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: screenWidth * 0.35,
//                     child: Text(
//                       '${detail['label']}:',
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.035,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       detail['value']!,
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.035,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class DebutantsPage extends StatefulWidget {
  const DebutantsPage({super.key});

  @override
  State<DebutantsPage> createState() => _DebutantsPageState();
}

class _DebutantsPageState extends State<DebutantsPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  // Variables pour l'image (Web et Mobile)
  Uint8List? _debutantImageBytes;
  File? _debutantImageFile;
  String? _debutantImagePath;
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

  String _typeResponsable = 'Dirigeant';

  // Animations
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  // Liste des débutants enregistrés
  final List<Map<String, dynamic>> _debutantsList = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
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
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 800,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _debutantImageBytes = bytes;
            _debutantImagePath = image.path;
            _hasImage = true;
          });
        } else {
          setState(() {
            _debutantImageFile = File(image.path);
            _debutantImagePath = image.path;
            _hasImage = true;
          });
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo ajoutée avec succès !'),
            backgroundColor: Color(0xFF4CAF50),
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
        backgroundColor: const Color(0xFF2E7D32),
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
                    _debutantImageBytes = null;
                    _debutantImageFile = null;
                    _debutantImagePath = null;
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

  void _saveDebutant() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _debutantsList.add({
          'responsable': _responsableController.text,
          'typeResponsable': _typeResponsable,
          'contactResponsable': _contactResponsableController.text,
          'nom': _nomController.text,
          'prenom': _prenomController.text,
          'age': _ageController.text,
          'classe': _classeController.text,
          'personneUrgente': _personneUrgenteController.text,
          'contactUrgente': _contactUrgenteController.text,
          'adresse': _adresseController.text,
          'lieuNaissance': _lieuNaissanceController.text,
          'dateNaissance': _dateNaissanceController.text,
          'imageBytes': _debutantImageBytes,
          'imageFile': _debutantImageFile,
          'imagePath': _debutantImagePath,
          'hasImage': _hasImage,
        });
      });

      // Réinitialiser le formulaire
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

      setState(() {
        _debutantImageBytes = null;
        _debutantImageFile = null;
        _debutantImagePath = null;
        _hasImage = false;
        _typeResponsable = 'Dirigeant';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 10),
              Text('Débutant enregistré avec succès !'),
            ],
          ),
          backgroundColor: const Color(0xFF4CAF50),
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
            // Header
            _buildHeader(screenWidth, screenHeight),

            // Corps principal
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),

                    // Formulaire d'enregistrement
                    _buildRegistrationForm(screenWidth, screenHeight),

                    SizedBox(height: screenHeight * 0.03),

                    // Liste des débutants
                    if (_debutantsList.isNotEmpty)
                      _buildDebutantsList(screenWidth, screenHeight),
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
          colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
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
              // Logo animé à gauche
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFD32F2F),
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFEB3B).withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 3,
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
                                Icons.church,
                                color: Color(0xFF2E7D32),
                                size: 30,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Titre central
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
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4CAF50).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Text(
                      'DÉBUTANTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),

              // Icône utilisateur à droite
              Container(
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFFFEB3B), width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD32F2F).withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF2E7D32),
                  size: screenWidth * 0.08,
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          // Devise
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
            color: const Color(0xFF2E7D32).withOpacity(0.3),
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
            // Titre du formulaire
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
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

            // Section Responsable
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

            // Section Débutant
            _buildSectionTitle('🌟 Informations du Débutant', screenWidth),
            SizedBox(height: screenHeight * 0.02),

            // Photo du débutant (OPTIONNELLE)
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
                              ? const Color(0xFF4CAF50)
                              : Colors.grey[400]!,
                          width: 3,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF4CAF50).withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: _hasImage
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: _buildDebutantImage(screenWidth),
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
                    'Ex: 10',
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: _buildTextField(
                    'Classe',
                    Icons.school,
                    _classeController,
                    'Ex: CM2',
                  ),
                ),
              ],
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

            // Section Urgence
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

            // Bouton d'enregistrement
            Center(
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4CAF50).withOpacity(0.5),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: _saveDebutant,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save, color: Colors.white, size: 28),
                        const SizedBox(width: 10),
                        Text(
                          'ENREGISTRER LE DÉBUTANT',
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

  Widget _buildDebutantImage(double screenWidth) {
    if (kIsWeb && _debutantImageBytes != null) {
      return Image.memory(
        _debutantImageBytes!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else if (!kIsWeb && _debutantImageFile != null) {
      return Image.file(
        _debutantImageFile!,
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
            color: const Color(0xFF4CAF50),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2E7D32),
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
          prefixIcon: Icon(icon, color: const Color(0xFF4CAF50)),
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
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
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
          prefixIcon: Icon(icon, color: const Color(0xFF4CAF50)),
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
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF2E7D32)),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDebutantsList(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('📋 Liste des Débutants', screenWidth),
          SizedBox(height: screenHeight * 0.02),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _debutantsList.length,
            itemBuilder: (context, index) {
              final debutant = _debutantsList[index];
              return _buildDebutantCard(debutant, screenWidth, screenHeight);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDebutantCard(
    Map<String, dynamic> debutant,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF4CAF50).withOpacity(0.1),
            const Color(0xFF2E7D32).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF4CAF50), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withOpacity(0.2),
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
                builder: (context) => DebutantDetailPage(debutant: debutant),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                // Photo
                Container(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF4CAF50),
                      width: 2,
                    ),
                    gradient: debutant['hasImage'] != true
                        ? const LinearGradient(
                            colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                          )
                        : null,
                  ),
                  child: ClipOval(child: _buildListDebutantImage(debutant)),
                ),

                SizedBox(width: screenWidth * 0.04),

                // Infos
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${debutant['prenom']} ${debutant['nom']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.cake, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 5),
                          Text(
                            '${debutant['age']} ans',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 15),
                          Icon(Icons.school, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 5),
                          Text(
                            debutant['classe'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Icon(Icons.arrow_forward_ios, color: Color(0xFF4CAF50)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListDebutantImage(Map<String, dynamic> debutant) {
    if (kIsWeb && debutant['imageBytes'] != null) {
      return Image.memory(debutant['imageBytes'], fit: BoxFit.cover);
    } else if (!kIsWeb && debutant['imageFile'] != null) {
      return Image.file(debutant['imageFile'], fit: BoxFit.cover);
    }
    return const Icon(Icons.church, color: Colors.white, size: 30);
  }
}

// Page de détails du débutant avec génération de carte
class DebutantDetailPage extends StatelessWidget {
  final Map<String, dynamic> debutant;

  const DebutantDetailPage({super.key, required this.debutant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Détails du Débutant'),
        backgroundColor: const Color(0xFF4CAF50),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),

            // Carte d'identité
            _buildIDCard(screenWidth, screenHeight),

            SizedBox(height: screenHeight * 0.03),

            // Bouton de téléchargement
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFD32F2F), Color(0xFFB71C1C)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD32F2F).withOpacity(0.5),
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
                          content: Text(
                            'Téléchargement de la carte en cours...',
                          ),
                          backgroundColor: Color(0xFF4CAF50),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.download,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'TÉLÉCHARGER LA CARTE',
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

            SizedBox(height: screenHeight * 0.03),

            // Détails complets
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
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF4CAF50), width: 3),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.4),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // En-tête de la carte
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(17),
                topRight: Radius.circular(17),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'CARTE DÉBUTANT',
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
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 3),
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

          // Corps de la carte
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Section avec photos
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo Groupe Samuel à gauche
                    Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF4CAF50),
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
                              Icons.church,
                              color: Color(0xFF2E7D32),
                              size: 50,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Informations centrales
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCardInfoRow(
                            'Nom:',
                            debutant['nom'].toString().toUpperCase(),
                            screenWidth,
                          ),
                          const SizedBox(height: 8),
                          _buildCardInfoRow(
                            'Prénom:',
                            debutant['prenom'],
                            screenWidth,
                          ),
                          const SizedBox(height: 8),
                          _buildCardInfoRow(
                            'Né(e) le:',
                            debutant['dateNaissance'],
                            screenWidth,
                          ),
                          const SizedBox(height: 8),
                          _buildCardInfoRow(
                            'À:',
                            debutant['lieuNaissance'],
                            screenWidth,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 15),

                    // Photo du débutant à droite
                    Container(
                      width: screenWidth * 0.25,
                      height: screenWidth * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFD32F2F),
                          width: 2,
                        ),
                        gradient: debutant['hasImage'] != true
                            ? const LinearGradient(
                                colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
                              )
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: _buildDetailImage(debutant),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Autres informations
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildCardInfoRow(
                              'Classe:',
                              debutant['classe'],
                              screenWidth,
                            ),
                          ),
                          Expanded(
                            child: _buildCardInfoRow(
                              'Âge:',
                              '${debutant['age']} ans',
                              screenWidth,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      _buildCardInfoRow(
                        'Adresse:',
                        debutant['adresse'],
                        screenWidth,
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Color(0xFF4CAF50)),
                      const SizedBox(height: 10),
                      _buildCardInfoRow(
                        'Contact urgence:',
                        debutant['contactUrgente'],
                        screenWidth,
                        isEmergency: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // Pied de carte
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4CAF50).withOpacity(0.2),
                        const Color(0xFF2E7D32).withOpacity(0.1),
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
                            color: const Color(0xFF2E7D32),
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

  Widget _buildDetailImage(Map<String, dynamic> debutant) {
    if (kIsWeb && debutant['imageBytes'] != null) {
      return Image.memory(debutant['imageBytes'], fit: BoxFit.cover);
    } else if (!kIsWeb && debutant['imageFile'] != null) {
      return Image.file(debutant['imageFile'], fit: BoxFit.cover);
    }
    return const Icon(Icons.church, color: Colors.white, size: 50);
  }

  Widget _buildCardInfoRow(
    String label,
    String value,
    double screenWidth, {
    bool isEmergency = false,
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
                : const Color(0xFF2E7D32),
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

  Widget _buildDetailsSection(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E7D32).withOpacity(0.3),
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
                  color: const Color(0xFF4CAF50),
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
                  color: const Color(0xFF2E7D32),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(color: Color(0xFF4CAF50), thickness: 2),
          const SizedBox(height: 20),

          // Responsable
          _buildDetailSection('👤 RESPONSABLE', [
            {'label': 'Type', 'value': debutant['typeResponsable']},
            {'label': 'Nom', 'value': debutant['responsable']},
            {'label': 'Contact', 'value': debutant['contactResponsable']},
          ], screenWidth),

          const SizedBox(height: 20),

          // Identité complète
          _buildDetailSection('🌟 IDENTITÉ COMPLÈTE', [
            {
              'label': 'Nom complet',
              'value': '${debutant['prenom']} ${debutant['nom']}',
            },
            {'label': 'Date de naissance', 'value': debutant['dateNaissance']},
            {'label': 'Lieu de naissance', 'value': debutant['lieuNaissance']},
            {'label': 'Âge', 'value': '${debutant['age']} ans'},
            {'label': 'Classe', 'value': debutant['classe']},
            {'label': 'Adresse', 'value': debutant['adresse']},
          ], screenWidth),

          const SizedBox(height: 20),

          // Contact d'urgence
          _buildDetailSection(
            '🚨 CONTACT D\'URGENCE',
            [
              {
                'label': 'Personne à prévenir',
                'value': debutant['personneUrgente'],
              },
              {'label': 'Téléphone', 'value': debutant['contactUrgente']},
            ],
            screenWidth,
            isEmergency: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailSection(
    String title,
    List<Map<String, String>> details,
    double screenWidth, {
    bool isEmergency = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isEmergency ? const Color(0xFFFFEBEE) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isEmergency
              ? const Color(0xFFD32F2F).withOpacity(0.3)
              : const Color(0xFF4CAF50).withOpacity(0.3),
          width: 1,
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
                  : const Color(0xFF2E7D32),
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
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      detail['value']!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.black87,
                      ),
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
