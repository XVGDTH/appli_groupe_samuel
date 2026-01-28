import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gal/gal.dart';
import 'package:groupe_samuel_appli/services/membre_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage>
    with SingleTickerProviderStateMixin {
  String _selectedCategory = 'Tous';
  List<Map<String, dynamic>> _allMembers = [];
  List<Map<String, dynamic>> _filteredMembers = [];
  bool _isLoading = true;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  // initialisation de la barre de scrolling horizontal des catégories

  late ScrollController _categoryScrollController;

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Tous', 'icon': Icons.list, 'color': Color(0xFF66BB6A)},
    {'name': 'Debutant', 'icon': Icons.star, 'color': Color(0xFF66BB6A)},
    {'name': 'Promettant', 'icon': Icons.stars, 'color': Color(0xFF81C784)},
    {
      'name': 'Missionnaire',
      'icon': Icons.auto_awesome,
      'color': Color(0xFFFF9800),
    },
    {'name': 'Aine', 'icon': Icons.emoji_events, 'color': Color(0xFFE53935)},
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _categoryScrollController = ScrollController();

    _loadAllMembers();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  Future<void> _loadAllMembers() async {
    setState(() => _isLoading = true);

    try {
      final debutants = await MembreService.getAllByCategorie('Debutant') ?? [];
      final promettants =
          await MembreService.getAllByCategorie('Promettant') ?? [];
      final missionnaires =
          await MembreService.getAllByCategorie('Missionnaire') ?? [];
      final aines = await MembreService.getAllByCategorie('Aine') ?? [];

      List<Map<String, dynamic>> allData = [];

      // Combine toutes les catégories
      for (var membre in [
        ...debutants,
        ...promettants,
        ...missionnaires,
        ...aines,
      ]) {
        allData.add({
          'id': membre.id,
          'categorie': membre.categorie,
          'responsable': membre.nomResponsable,
          'typeResponsable': membre.typeResponsable,
          'contactResponsable': membre.contactResponsable,
          'nom': membre.nom,
          'prenom': membre.prenom,
          'age': membre.age,
          'sexe': membre.sexe,
          'classe': membre.classe,
          'personneUrgente': membre.personneUrgence,
          'contactUrgente': membre.contactUrgente,
          'adresse': membre.adresse,
          'lieuNaissance': membre.lieuNaissance,
          'dateNaissance': membre.dateNaissance,
          'imageBytes': membre.photoBytesAsUint8List,
          'hasImage': membre.photoBytes != null,
          'dateEnregistrement': membre.id, // Utilisé comme timestamp
        });
      }

      // Trier par ID décroissant (plus récent en premier)
      allData.sort((a, b) => b['id'].compareTo(a['id']));

      setState(() {
        _allMembers = allData;
        _filterMembers();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Erreur de chargement: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _filterMembers() {
    if (_selectedCategory == 'Tous') {
      _filteredMembers = _allMembers;
    } else {
      _filteredMembers = _allMembers
          .where((m) => m['categorie'] == _selectedCategory)
          .toList();
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Debutant':
        return const Color(0xFF66BB6A);
      case 'Promettant':
        return const Color(0xFF81C784);
      case 'Missionnaire':
        return const Color(0xFFFF9800);
      case 'Aine':
        return const Color(0xFFE53935);
      default:
        return const Color(0xFF66BB6A);
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Debutant':
        return Icons.star;
      case 'Promettant':
        return Icons.stars;
      case 'Missionnaire':
        return Icons.auto_awesome;
      case 'Aine':
        return Icons.emoji_events;
      default:
        return Icons.person;
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
            _buildCategoryFilter(screenWidth, screenHeight),
            Expanded(
              child: _isLoading
                  ? _buildLoadingState()
                  : _filteredMembers.isEmpty
                  ? _buildEmptyState()
                  : _buildMembersList(screenWidth, screenHeight),
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
              AnimatedBuilder(
                animation: _pulseController,
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
                                Icons.history,
                                color: Color(0xFF66BB6A),
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
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'HISTORIQUE',
                        style: TextStyle(
                          color: const Color(0xFFFFEB3B),
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.history_edu,
                            color: Color(0xFF66BB6A),
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${_filteredMembers.length} enregistrement${_filteredMembers.length > 1 ? 's' : ''}',
                            style: TextStyle(
                              color: const Color(0xFF66BB6A),
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.refresh, color: Colors.white, size: 28),
                onPressed: _loadAllMembers,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _buildCategoryFilter(double screenWidth, double screenHeight) {
  //   return Container(
  //     height: screenHeight * 0.12,
  //     padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
  //       itemCount: _categories.length,
  //       itemBuilder: (context, index) {
  //         final category = _categories[index];
  //         final isSelected = _selectedCategory == category['name'];

  //         return GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               _selectedCategory = category['name'] as String;
  //               _filterMembers();
  //             });
  //           },
  //           child: Container(
  //             margin: const EdgeInsets.only(right: 12),
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             decoration: BoxDecoration(
  //               gradient: isSelected
  //                   ? LinearGradient(
  //                       colors: [
  //                         category['color'] as Color,
  //                         (category['color'] as Color).withOpacity(0.7),
  //                       ],
  //                     )
  //                   : null,
  //               color: isSelected ? null : Colors.white,
  //               borderRadius: BorderRadius.circular(20),
  //               border: Border.all(color: category['color'] as Color, width: 2),
  //               boxShadow: isSelected
  //                   ? [
  //                       BoxShadow(
  //                         color: (category['color'] as Color).withOpacity(0.4),
  //                         blurRadius: 15,
  //                         offset: const Offset(0, 5),
  //                       ),
  //                     ]
  //                   : [],
  //             ),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(
  //                   category['icon'] as IconData,
  //                   color: isSelected
  //                       ? Colors.white
  //                       : category['color'] as Color,
  //                   size: 28,
  //                 ),
  //                 const SizedBox(height: 5),
  //                 Text(
  //                   category['name'] as String,
  //                   style: TextStyle(
  //                     color: isSelected
  //                         ? Colors.white
  //                         : category['color'] as Color,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: screenWidth * 0.032,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
  Widget _buildCategoryFilter(double screenWidth, double screenHeight) {
    // final ScrollController _scrollController = ScrollController();

    return Container(
      height: screenHeight * 0.14, // Hauteur légèrement augmentée
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _categoryScrollController,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category['name'];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category['name'] as String;
                      _filterMembers();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? LinearGradient(
                              colors: [
                                category['color'] as Color,
                                (category['color'] as Color).withOpacity(0.7),
                              ],
                            )
                          : null,
                      color: isSelected ? null : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: category['color'] as Color,
                        width: 2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: (category['color'] as Color).withOpacity(
                                  0.4,
                                ),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'] as IconData,
                          color: isSelected
                              ? Colors.white
                              : category['color'] as Color,
                          size: 28,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          category['name'] as String,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : category['color'] as Color,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.032,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Barre de défilement personnalisée colorée (bleue)
          const SizedBox(height: 8),
          Container(
            height: 6,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedBuilder(
                  animation: _categoryScrollController,
                  builder: (context, child) {
                    double scrollExtent = _categoryScrollController.hasClients
                        ? _categoryScrollController.position.maxScrollExtent
                        : 0;
                    double scrollPosition = _categoryScrollController.hasClients
                        ? _categoryScrollController.position.pixels
                        : 0;

                    double thumbWidth = scrollExtent > 0
                        ? (constraints.maxWidth * constraints.maxWidth) /
                              (constraints.maxWidth + scrollExtent)
                        : constraints.maxWidth;

                    double thumbPosition = scrollExtent > 0
                        ? (scrollPosition / scrollExtent) *
                              (constraints.maxWidth - thumbWidth)
                        : 0;

                    return Stack(
                      children: [
                        Positioned(
                          left: thumbPosition,
                          child: Container(
                            width: thumbWidth,
                            height: 6,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFF2196F3,
                                  ).withOpacity(0.5),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF66BB6A)),
          ),
          SizedBox(height: 20),
          Text(
            'Chargement de l\'historique...',
            style: TextStyle(
              color: Color(0xFF66BB6A),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 100, color: Colors.grey[400]),
          const SizedBox(height: 20),
          Text(
            _selectedCategory == 'Tous'
                ? 'Aucun enregistrement'
                : 'Aucun $_selectedCategory enregistré',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Les nouveaux enregistrements\napparaîtront ici',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildMembersList(double screenWidth, double screenHeight) {
    return RefreshIndicator(
      onRefresh: _loadAllMembers,
      color: const Color(0xFF66BB6A),
      child: ListView.builder(
        padding: EdgeInsets.all(screenWidth * 0.05),
        itemCount: _filteredMembers.length,
        itemBuilder: (context, index) {
          final membre = _filteredMembers[index];
          return _buildMemberCard(membre, screenWidth, screenHeight);
        },
      ),
    );
  }

  Widget _buildMemberCard(
    Map<String, dynamic> membre,
    double screenWidth,
    double screenHeight,
  ) {
    final categoryColor = _getCategoryColor(membre['categorie']);
    final categoryIcon = _getCategoryIcon(membre['categorie']);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: categoryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: categoryColor.withOpacity(0.2),
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
                builder: (context) => DetailHistoriquePage(membre: membre),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  width: screenWidth * 0.18,
                  height: screenWidth * 0.22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: categoryColor, width: 2),
                    gradient: membre['hasImage'] != true
                        ? LinearGradient(
                            colors: [
                              categoryColor,
                              categoryColor.withOpacity(0.7),
                            ],
                          )
                        : null,
                  ),
                  child: ClipOval(
                    child: membre['imageBytes'] != null
                        ? Image.memory(
                            membre['imageBytes'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          )
                        : Icon(categoryIcon, color: Colors.white, size: 35),
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: categoryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  categoryIcon,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  membre['categorie'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${membre['prenom']} ${membre['nom']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: categoryColor,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.cake, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            '${membre['age']} ans',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.school, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              membre['classe'],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: categoryColor, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Page de détails
class DetailHistoriquePage extends StatelessWidget {
  final Map<String, dynamic> membre;
  final GlobalKey _cardKey = GlobalKey();

  DetailHistoriquePage({super.key, required this.membre});

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Debutant':
        return const Color(0xFF66BB6A);
      case 'Promettant':
        return const Color(0xFF81C784);
      case 'Missionnaire':
        return const Color(0xFFFF9800);
      case 'Aine':
        return const Color(0xFFE53935);
      default:
        return const Color(0xFF66BB6A);
    }
  }

  String _getCategoryTitle(String category) {
    switch (category) {
      case 'Debutant':
        return 'DÉBUTANT';
      case 'Promettant':
        return 'FUTUR PROMETTANT';
      case 'Missionnaire':
        return 'FUTUR MISSIONNAIRE';
      case 'Aine':
        return 'FUTUR AÎNÉ';
      default:
        return category.toUpperCase();
    }
  }

  Future<void> _downloadCard(BuildContext context) async {
    try {
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
          _cardKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
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
            'carte_${membre['categorie']}_${DateTime.now().millisecondsSinceEpoch}.png',
          )
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        final tempDir = await getTemporaryDirectory();
        final fileName =
            'carte_${membre['categorie']}_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(pngBytes);

        await Gal.putImage(file.path, album: 'Groupe Samuel');
        await file.delete();
      }

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Carte enregistrée avec succès !'),
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final categoryColor = _getCategoryColor(membre['categorie']);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Détails ${_getCategoryTitle(membre['categorie'])}'),
        backgroundColor: categoryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            _buildIDCard(screenWidth, screenHeight, categoryColor),
            SizedBox(height: screenHeight * 0.03),
            _buildDownloadButton(
              context,
              screenWidth,
              screenHeight,
              categoryColor,
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildDetailsSection(screenWidth, screenHeight),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildIDCard(
    double screenWidth,
    double screenHeight,
    Color categoryColor,
  ) {
    return RepaintBoundary(
      key: _cardKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: categoryColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.4),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [categoryColor, categoryColor.withOpacity(0.8)],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'CARTE ${_getCategoryTitle(membre['categorie'])}',
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
                    'chapelle SAINT PAUL de Ouezzin ville',
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
                          border: Border.all(color: categoryColor, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.stars,
                                color: categoryColor,
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
                              membre['nom'].toString().toUpperCase(),
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'Prénom:',
                              membre['prenom'],
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'Né(e) le:',
                              membre['dateNaissance'],
                              screenWidth,
                            ),
                            const SizedBox(height: 8),
                            _buildCardInfo(
                              'À:',
                              membre['lieuNaissance'],
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
                          gradient: membre['hasImage'] != true
                              ? LinearGradient(
                                  colors: [
                                    categoryColor,
                                    categoryColor.withOpacity(0.7),
                                  ],
                                )
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: membre['imageBytes'] != null
                              ? Image.memory(
                                  membre['imageBytes'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                              : const Icon(
                                  Icons.stars,
                                  color: Colors.white,
                                  size: 50,
                                ),
                        ),

                        // SUITE DU CODE DE LA PAGE DÉTAILS (à ajouter après la fin du premier artifact)
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
                                membre['classe'],
                                screenWidth,
                              ),
                            ),
                            Expanded(
                              child: _buildCardInfo(
                                'Âge:',
                                '${membre['age']} ans',
                                screenWidth,
                              ),
                            ),
                          ],
                        ),
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
                                '${membre['typeResponsable']} - ${membre['responsable']}',
                                screenWidth,
                              ),
                              const SizedBox(height: 5),
                              _buildCardInfo(
                                'Contact:',
                                membre['contactResponsable'],
                                screenWidth,
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: Color(0xFF66BB6A)),
                        _buildCardInfo(
                          'Personne urgence:',
                          membre['personneUrgente'],
                          screenWidth,
                        ),
                        const SizedBox(height: 5),
                        _buildCardInfo(
                          'Contact urgence:',
                          membre['contactUrgente'],
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

  Widget _buildCardInfo(
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
    Color categoryColor,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [categoryColor, categoryColor.withOpacity(0.7)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: categoryColor.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => _downloadCard(context),
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
            {'label': 'Type', 'value': membre['typeResponsable']},
            {'label': 'Nom', 'value': membre['responsable']},
            {'label': 'Contact', 'value': membre['contactResponsable']},
          ], screenWidth),
          const SizedBox(height: 20),
          _buildSection('⭐ IDENTITÉ', [
            {
              'label': 'Nom complet',
              'value': '${membre['prenom']} ${membre['nom']}',
            },
            {'label': 'Sexe', 'value': membre['sexe']},
            {'label': 'Date de naissance', 'value': membre['dateNaissance']},
            {'label': 'Lieu de naissance', 'value': membre['lieuNaissance']},
            {'label': 'Âge', 'value': '${membre['age']} ans'},
            {'label': 'Classe', 'value': membre['classe']},
            {'label': 'Adresse', 'value': membre['adresse']},
          ], screenWidth),
          const SizedBox(height: 20),
          _buildSection(
            '🚨 CONTACT D\'URGENCE',
            [
              {
                'label': 'Personne à prévenir',
                'value': membre['personneUrgente'],
              },
              {'label': 'Téléphone', 'value': membre['contactUrgente']},
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
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isEmergency ? const Color(0xFFFFEBEE) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isEmergency
              ? const Color(0xFFD32F2F).withOpacity(0.3)
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
