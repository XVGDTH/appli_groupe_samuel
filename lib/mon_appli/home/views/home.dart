import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:groupe_samuel_appli/historique/views/historique.dart';
import 'package:groupe_samuel_appli/messagerie/views/messagerie.dart';
import 'package:groupe_samuel_appli/mon_appli/acceuil/views/acceuil.dart';
import 'package:groupe_samuel_appli/mon_appli/ain%C3%A9s/views/futurs_ain%C3%A9s.dart';
import 'package:groupe_samuel_appli/mon_appli/debutants/views/debutants.dart';
import 'package:groupe_samuel_appli/mon_appli/futurs_ain%C3%A9s/views/futurs_missionnaire.dart';
import 'package:groupe_samuel_appli/mon_appli/promettants/views/futurs_promettants.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

// Remplacez votre variable _userImage
Uint8List? _userImageBytes; // Pour Web
File? _userImageFile; // Pour mobile

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  File? _userImage;
  final ImagePicker _picker = ImagePicker();
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _rotateAnimation = Tween<double>(begin: 0, end: 0.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Réduit la qualité pour éviter les erreurs
      maxWidth: 800, // Limite la largeur
    );

    if (image != null) {
      if (kIsWeb) {
        // Pour Web
        final bytes = await image.readAsBytes();
        setState(() {
          _userImageBytes = bytes;
        });
      } else {
        // Pour Mobile
        setState(() {
          _userImageFile = File(image.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20), // Vert foncé
      body: SafeArea(
        child: Column(
          children: [
            // Header avec logo et profil utilisateur
            _buildHeader(screenWidth, screenHeight),

            // Corps principal scrollable
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.04),

                    // Grande icône centrale animée
                    _buildCentralIcon(screenWidth, screenHeight),

                    SizedBox(height: screenHeight * 0.04),

                    // Titre
                    Text(
                      'Choisissez votre catégorie',
                      style: TextStyle(
                        color: const Color(0xFFFFEB3B),
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Boutons catégories
                    _buildCategoryButtons(screenWidth, screenHeight),

                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ),
            ),

            // Footer attractif
            _buildFooter(screenWidth, screenHeight),
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
        gradient: LinearGradient(
          colors: [const Color(0xFF2E7D32), const Color(0xFF1B5E20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo à gauche
          Container(
            width: screenWidth * 0.15,
            height: screenWidth * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xFFD32F2F), // Rouge
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFEB3B).withOpacity(0.5),
                  blurRadius: 15,
                  spreadRadius: 2,
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

          // Titre
          Column(
            children: [
              Text(
                'GROUPE SAMUEL',
                style: TextStyle(
                  color: const Color(0xFFFFEB3B),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'Archidiocèse de Bobo',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),

          // Photo utilisateur à droite
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFFFEB3B), // Jaune
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFD32F2F).withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipOval(
                child: _userImage != null
                    ? Image.file(_userImage!, fit: BoxFit.cover)
                    : Icon(
                        Icons.person,
                        color: const Color(0xFF2E7D32),
                        size: screenWidth * 0.08,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCentralIcon(double screenWidth, double screenHeight) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotateAnimation.value,
            child: Container(
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [const Color(0xFFFFEB3B), const Color(0xFFD32F2F)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFEB3B).withOpacity(0.6),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                  BoxShadow(
                    color: const Color(0xFFD32F2F).withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/logo.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.church_outlined,
                          color: Color(0xFF2E7D32),
                          size: 80,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryButtons(double screenWidth, double screenHeight) {
    final categories = [
      {
        'name': 'Débutant',
        'icon': Icons.star_outline,
        'color': Color(0xFF4CAF50),
        'page': const DebutantsPage(),
      },
      {
        'name': 'Futur Promettant',
        'icon': Icons.stars,
        'color': Color(0xFF66BB6A),
        'page': const PromettantsPage(),
      },
      {
        'name': 'Futur Missionnaire',
        'icon': Icons.auto_awesome,
        'color': Color(0xFFFF9800),
        'page': const FutursAinesPage(),
      },
      {
        'name': 'Futur Aîné',
        'icon': Icons.emoji_events,
        'color': Color(0xFFD32F2F),
        'page': const AinesPage(),
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Column(
        children: categories.map((category) {
          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.015),
            child: _buildCategoryButton(
              category['name'] as String,
              category['icon'] as IconData,
              category['color'] as Color,
              category['page'] as Widget,
              screenWidth,
              screenHeight,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryButton(
    String title,
    IconData icon,
    Color color,
    Widget page,
    double screenWidth,
    double screenHeight,
  ) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.075,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
            // TODO: Navigation vers la page de catégorie
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Catégorie $title sélectionnée'),
                backgroundColor: color,
                duration: const Duration(seconds: 1),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 28),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF1B5E20),
            const Color(0xFF2E7D32),
            const Color(0xFF1B5E20),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFEB3B).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border(
          top: BorderSide(color: const Color(0xFFFFEB3B), width: 3),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.025,
        ),
        child: Column(
          children: [
            // Icônes sociales
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     _buildSocialIcon(Icons.facebook, const Color(0xFFD32F2F)),
            //     SizedBox(width: screenWidth * 0.04),
            //     _buildSocialIcon(Icons.mail, const Color(0xFFFFEB3B)),
            //     SizedBox(width: screenWidth * 0.04),
            //     _buildSocialIcon(Icons.phone, const Color(0xFF4CAF50)),
            //     SizedBox(width: screenWidth * 0.04),
            //     _buildSocialIcon(Icons.share, const Color(0xFFFF9800)),
            //   ],
            // ),

            // Nouvelle barre de navigation : Accueil, Messages, Historique, Déconnexion
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Accueil
                InkWell(
                  onTap: () {
                    // Tu es déjà sur la page d'accueil, donc on peut juste rafraîchir ou rien faire
                    // Ou rediriger vers Home si tu as plusieurs niveaux
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (route) => false,
                    );
                  },
                  child: _buildSocialIcon(Icons.home, const Color(0xFFFFEB3B)),
                ),
                SizedBox(width: screenWidth * 0.04),

                // Messages (à adapter selon ta page de messages)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MessageriePage()),
                    );
                    // Remplace par ta vraie page de messages quand tu l'auras
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Page Messages')),
                    );
                    // Exemple futur : Navigator.push(context, MaterialPageRoute(builder: (_) => MessagesPage()));
                  },
                  child: _buildSocialIcon(
                    Icons.message,
                    const Color(0xFF4CAF50),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),

                // Historique
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => HistoriquePage()),
                    );
                    // Remplace par ta page d'historique quand elle existe
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Bienvenue sur votre page historique'),
                      ),
                    );
                  },
                  child: _buildSocialIcon(
                    Icons.history,
                    const Color(0xFFFF9800),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),

                // Déconnexion
                InkWell(
                  onTap: () {
                    // Boîte de dialogue de confirmation (recommandé)
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Déconnexion'),
                        content: const Text(
                          'Voulez-vous vraiment vous déconnecter ?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Annuler'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Ferme le dialog
                              // Ici tu peux ajouter : FirebaseAuth.instance.signOut(); si tu utilises Firebase
                              // Puis rediriger vers la page de login
                              // Navigator.pushNamedAndRemoveUntil(
                              //   context,
                              //   '/welcome', // Remplace par le nom de ta route de connexion
                              //   (route) => true,
                              // );
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Welcome(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text(
                              'Oui',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: _buildSocialIcon(
                    Icons.logout,
                    const Color(0xFFD32F2F),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.015),

            // Texte footer
            Text(
              '© 2025 Groupe Samuel',
              style: TextStyle(
                color: const Color(0xFFFFEB3B),
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              'Archidiocèse de Bobo-Dioulasso',
              style: TextStyle(
                color: Colors.white70,
                fontSize: screenWidth * 0.03,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: const Color(0xFFD32F2F),
                  size: screenWidth * 0.04,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Pret pour Servir avec Joie, avec Vérité',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.03,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}
