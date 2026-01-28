import 'package:flutter/material.dart';
import 'package:groupe_samuel_appli/models/notification_model.dart';
import 'package:groupe_samuel_appli/services/notification_service.dart';

import 'package:intl/intl.dart';

class MessageriePage extends StatefulWidget {
  const MessageriePage({super.key});

  @override
  State<MessageriePage> createState() => _MessageriePageState();
}

class _MessageriePageState extends State<MessageriePage>
    with SingleTickerProviderStateMixin {
  List<NotificationModel> _notifications = [];
  List<NotificationModel> _notificationsFiltrees = [];
  String _filtreCategorie = 'Toutes';
  bool _afficherSeulementNonLues = false;
  bool _isLoading = true;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _chargerNotifications();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _chargerNotifications() async {
    setState(() => _isLoading = true);

    try {
      final notifications = await NotificationService.getAllNotifications();
      if (mounted) {
        setState(() {
          _notifications = notifications;
          _appliquerFiltres();
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        _afficherErreur('Erreur lors du chargement des notifications');
      }
    }
  }

  void _appliquerFiltres() {
    _notificationsFiltrees = _notifications.where((notif) {
      bool correspondCategorie =
          _filtreCategorie == 'Toutes' || notif.categorie == _filtreCategorie;
      bool correspondLecture = !_afficherSeulementNonLues || !notif.estLue;
      return correspondCategorie && correspondLecture;
    }).toList();
  }

  Future<void> _marquerCommeLue(NotificationModel notification) async {
    if (!notification.estLue) {
      try {
        await NotificationService.marquerCommeLue(notification.id);
        await _chargerNotifications();
      } catch (e) {
        _afficherErreur('Erreur lors de la mise à jour');
      }
    }
  }

  Future<void> _marquerToutesCommeLues() async {
    try {
      await NotificationService.marquerToutesCommeLues();
      await _chargerNotifications();
      if (mounted) {
        _afficherSucces('✅ Toutes les notifications marquées comme lues');
      }
    } catch (e) {
      _afficherErreur('Erreur lors de la mise à jour');
    }
  }

  Future<void> _supprimerNotification(NotificationModel notification) async {
    final confirmer = await _afficherDialogueConfirmation(
      'Confirmer la suppression',
      'Voulez-vous vraiment supprimer cette notification ?',
    );

    if (confirmer == true) {
      try {
        await NotificationService.supprimerNotification(notification.id);
        await _chargerNotifications();
        if (mounted) {
          _afficherSucces('🗑️ Notification supprimée');
        }
      } catch (e) {
        _afficherErreur('Erreur lors de la suppression');
      }
    }
  }

  Future<void> _supprimerToutes() async {
    final confirmer = await _afficherDialogueConfirmation(
      'Confirmer la suppression',
      'Voulez-vous vraiment supprimer TOUTES les notifications ?',
    );

    if (confirmer == true) {
      try {
        await NotificationService.supprimerToutesLesNotifications();
        await _chargerNotifications();
        if (mounted) {
          _afficherSucces('🗑️ Toutes les notifications supprimées');
        }
      } catch (e) {
        _afficherErreur('Erreur lors de la suppression');
      }
    }
  }

  Future<bool?> _afficherDialogueConfirmation(String titre, String message) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(titre),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  void _afficherSucces(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF66BB6A),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _afficherErreur(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _afficherDetailsNotification(NotificationModel notification) {
    _marquerCommeLue(notification);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _DetailNotificationSheet(
        notification: notification,
        onSupprimer: () {
          Navigator.pop(context);
          _supprimerNotification(notification);
        },
      ),
    );
  }

  Color _getCategorieColor(String categorie) {
    switch (categorie) {
      case 'Débutant':
        return const Color(0xFF66BB6A);
      case 'Promettant':
        return const Color(0xFF4CAF50);
      case 'Missionnaire':
        return const Color(0xFFFF9800);
      case 'Aîné':
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey;
    }
  }

  IconData _getCategorieIcon(String categorie) {
    switch (categorie) {
      case 'Débutant':
        return Icons.stars;
      case 'Promettant':
        return Icons.star;
      case 'Missionnaire':
        return Icons.volunteer_activism;
      case 'Aîné':
        return Icons.emoji_events;
      default:
        return Icons.notifications;
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
            _buildFiltres(screenWidth),
            Expanded(
              child: _isLoading
                  ? _buildLoadingState()
                  : _notificationsFiltrees.isEmpty
                  ? _buildEmptyState(screenWidth, screenHeight)
                  : _buildNotificationsList(screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF66BB6A)),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.notifications_active,
                  color: Color(0xFFFFEB3B),
                  size: 28,
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MESSAGERIE',
                    style: TextStyle(
                      color: const Color(0xFFFFEB3B),
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  FutureBuilder<int>(
                    future: NotificationService.compterNotificationsNonLues(),
                    builder: (context, snapshot) {
                      final count = snapshot.data ?? 0;
                      return Text(
                        '$count notification${count > 1 ? 's' : ''} non lue${count > 1 ? 's' : ''}',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: screenWidth * 0.032,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'marquer_toutes_lues') {
                _marquerToutesCommeLues();
              } else if (value == 'supprimer_toutes') {
                _supprimerToutes();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'marquer_toutes_lues',
                child: Row(
                  children: [
                    Icon(Icons.done_all, color: Color(0xFF66BB6A)),
                    SizedBox(width: 10),
                    Text('Tout marquer comme lu'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'supprimer_toutes',
                child: Row(
                  children: [
                    Icon(Icons.delete_sweep, color: Colors.red),
                    SizedBox(width: 10),
                    Text('Tout supprimer'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFiltres(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      color: Colors.white,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  [
                    'Toutes',
                    'Débutant',
                    'Promettant',
                    'Missionnaire',
                    'Aîné',
                  ].map((categorie) {
                    final isSelected = _filtreCategorie == categorie;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        selected: isSelected,
                        label: Text(categorie),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        backgroundColor: Colors.grey[200],
                        selectedColor: const Color(0xFF66BB6A),
                        checkmarkColor: Colors.white,
                        onSelected: (selected) {
                          setState(() {
                            _filtreCategorie = categorie;
                            _appliquerFiltres();
                          });
                        },
                      ),
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _afficherSeulementNonLues,
                activeColor: const Color(0xFF66BB6A),
                onChanged: (value) {
                  setState(() {
                    _afficherSeulementNonLues = value ?? false;
                    _appliquerFiltres();
                  });
                },
              ),
              const Text(
                'Afficher uniquement les non lues',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(double screenWidth) {
    return RefreshIndicator(
      onRefresh: _chargerNotifications,
      color: const Color(0xFF66BB6A),
      child: ListView.builder(
        padding: EdgeInsets.all(screenWidth * 0.04),
        itemCount: _notificationsFiltrees.length,
        itemBuilder: (context, index) {
          final notification = _notificationsFiltrees[index];
          return _buildNotificationCard(notification, screenWidth);
        },
      ),
    );
  }

  Widget _buildNotificationCard(
    NotificationModel notification,
    double screenWidth,
  ) {
    final color = _getCategorieColor(notification.categorie);
    final icon = _getCategorieIcon(notification.categorie);

    return Dismissible(
      key: Key(notification.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      confirmDismiss: (direction) async {
        return await _afficherDialogueConfirmation(
          'Supprimer',
          'Supprimer cette notification ?',
        );
      },
      onDismissed: (direction) => _supprimerNotification(notification),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: notification.estLue ? Colors.grey[300]! : color,
            width: notification.estLue ? 1 : 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(notification.estLue ? 0.1 : 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => _afficherDetailsNotification(notification),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.7)],
                      ),
                    ),
                    child: notification.photoAsUint8List != null
                        ? ClipOval(
                            child: Image.memory(
                              notification.photoAsUint8List!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(icon, color: Colors.white, size: 28),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                notification.titre,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: notification.estLue
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            if (!notification.estLue)
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification.message,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                notification.categorie,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              _formatDate(notification.dateCreation),
                              style: TextStyle(
                                fontSize: screenWidth * 0.028,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: screenWidth * 0.25,
            color: Colors.grey[400],
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            'Aucune notification',
            style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            _afficherSeulementNonLues
                ? 'Toutes les notifications sont lues'
                : 'Les nouvelles inscriptions apparaîtront ici',
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'À l\'instant';
        }
        return 'Il y a ${difference.inMinutes} min';
      }
      return 'Il y a ${difference.inHours}h';
    } else if (difference.inDays == 1) {
      return 'Hier';
    } else if (difference.inDays < 7) {
      return 'Il y a ${difference.inDays} jours';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}

// Widget détails de la notification
class _DetailNotificationSheet extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onSupprimer;

  const _DetailNotificationSheet({
    required this.notification,
    required this.onSupprimer,
  });

  Color _getCategorieColor(String categorie) {
    switch (categorie) {
      case 'Débutant':
        return const Color(0xFF66BB6A);
      case 'Promettant':
        return const Color(0xFF4CAF50);
      case 'Missionnaire':
        return const Color(0xFFFF9800);
      case 'Aîné':
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final color = _getCategorieColor(notification.categorie);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.7)],
                  ),
                ),
                child: Row(
                  children: [
                    if (notification.photoAsUint8List != null)
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.memory(
                            notification.photoAsUint8List!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    else
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${notification.prenomMembre} ${notification.nomMembre}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              notification.categorie,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildDetailSection(
                      'Informations personnelles',
                      Icons.person,
                      [
                        _buildDetailRow('Âge', '${notification.ageMembre} ans'),
                        _buildDetailRow('Sexe', notification.sexeMembre),
                        _buildDetailRow('Classe', notification.classeMembre),
                      ],
                      screenWidth,
                    ),
                    const SizedBox(height: 20),
                    _buildDetailSection(
                      'Responsable',
                      Icons.supervisor_account,
                      [
                        _buildDetailRow('Type', notification.typeResponsable),
                        _buildDetailRow('Nom', notification.nomResponsable),
                        _buildDetailRow(
                          'Contact',
                          notification.contactResponsable,
                        ),
                      ],
                      screenWidth,
                    ),
                    const SizedBox(height: 20),
                    _buildDetailSection(
                      'Contact d\'urgence',
                      Icons.emergency,
                      [
                        _buildDetailRow(
                          'Personne',
                          notification.personneUrgence,
                        ),
                        _buildDetailRow(
                          'Téléphone',
                          notification.contactUrgence,
                        ),
                      ],
                      screenWidth,
                      isEmergency: true,
                    ),
                    const SizedBox(height: 20),
                    _buildDetailSection(
                      'Date d\'inscription',
                      Icons.calendar_today,
                      [
                        // _buildDetailRow(
                        //   'Date',
                        //   DateFormat(
                        //     'dd MMMM yyyy à HH:mm',
                        //     'fr_FR',
                        //   ).format(notification.dateCreation),
                        // ),
                        _buildDetailRow(
                          'Date',
                          DateFormat(
                            'dd/MM/yyyy HH:mm',
                          ).format(notification.dateCreation),
                        ),
                      ],
                      screenWidth,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: onSupprimer,
                      icon: const Icon(Icons.delete),
                      label: const Text('Supprimer cette notification'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailSection(
    String titre,
    IconData icon,
    List<Widget> children,
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
          Row(
            children: [
              Icon(
                icon,
                color: isEmergency
                    ? const Color(0xFFD32F2F)
                    : const Color(0xFF66BB6A),
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                titre,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  color: isEmergency
                      ? const Color(0xFFD32F2F)
                      : const Color(0xFF66BB6A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }
}
