import 'package:flutter/material.dart';
import 'package:groupe_samuel_appli/mon_appli/home/views/home.dart';
import 'package:groupe_samuel_appli/mon_appli/inscription/views/inscription.dart';
import 'package:groupe_samuel_appli/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      try {
        // Vérification dans la base Isar via AuthService
        final user = await AuthService.login(
          username: _usernameController.text.trim(),
          password: _passwordController.text,
        );

        if (user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Connexion réussie ! Bienvenue.'),
              backgroundColor: Color(0xFF2E7D32),
            ),
          );

          // Redirection vers la page suivante (Home)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Home()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Identifiants incorrects. Vérifiez et réessayez.'),
              backgroundColor: Color(0xFFD32F2F),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur inattendue : $e'),
            backgroundColor: const Color(0xFFD32F2F),
          ),
        );
      } finally {
        setState(() => _isLoading = false);
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
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                // Background décoratif
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF2E7D32).withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -100,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD32F2F).withOpacity(0.2),
                    ),
                  ),
                ),

                // Contenu principal
                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.06),

                    // Titre animé
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'CONNEXION',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFEB3B), // Jaune
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    // Container blanc arrondi
                    Expanded(
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1A1A1A), // Noir/gris foncé
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.08,
                                vertical: screenHeight * 0.04,
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: screenHeight * 0.02),

                                    _buildLabel("Nom d'utilisateur :"),
                                    SizedBox(height: screenHeight * 0.01),
                                    _buildTextField(
                                      controller:
                                          _usernameController, // Utilise le nouveau controller
                                      hint: 'Votre nom ou prénom',
                                      icon: Icons.person_outline,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez entrer votre nom ou prénom';
                                        }
                                        return null;
                                      },
                                    ),

                                    // Champ Password
                                    _buildLabel('Mot de passe :'),
                                    SizedBox(height: screenHeight * 0.01),
                                    // _buildTextField(
                                    //   controller: _passwordController,
                                    //   hint: '',
                                    //   icon: Icons.lock_outline,
                                    //   isPassword: true,

                                    //   validator: (value) {
                                    //     if (value == null || value.isEmpty) {
                                    //       return 'Veuillez entrer votre mot de passe';
                                    //     }
                                    //     return null;
                                    //   },
                                    // ),
                                    _buildTextField(
                                      controller: _passwordController,
                                      hint: 'Votre mot de passe',
                                      icon: Icons.lock_outline,
                                      isPassword: true,
                                      obscureText: _obscurePassword,
                                      onTogglePassword: () {
                                        setState(
                                          () => _obscurePassword =
                                              !_obscurePassword,
                                        );
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Veuillez entrer votre mot de passe';
                                        }
                                        if (value.length < 6) {
                                          return 'Mot de passe trop court';
                                        }
                                        return null;
                                      },
                                    ),

                                    SizedBox(height: screenHeight * 0.04),

                                    // Bouton Se connecter
                                    SizedBox(
                                      width: double.infinity,
                                      height: 55,
                                      child: ElevatedButton(
                                        onPressed: _isLoading
                                            ? null
                                            : _handleLogin,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFFFEB3B,
                                          ), // Jaune
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          elevation: 5,
                                        ),
                                        child: _isLoading
                                            ? const SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 3,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                        Color
                                                      >(Color(0xFF1B5E20)),
                                                ),
                                              )
                                            : Text(
                                                'Se connecter',
                                                style: TextStyle(
                                                  fontSize: screenWidth * 0.045,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color(
                                                    0xFF1B5E20,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),

                                    SizedBox(height: screenHeight * 0.015),

                                    // Bouton S'inscrire
                                    SizedBox(
                                      width: double.infinity,
                                      height: 55,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Inscription(),
                                            ),
                                          );
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                            color: Color(0xFFFFEB3B),
                                            width: 2,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "S'inscrire",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.045,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFFFEB3B),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: screenHeight * 0.02),

                                    // Mot de passe oublié
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Inscription(),
                                            ),
                                          );
                                          // TODO: Navigation vers mot de passe oublié
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Mot de passe oublié ? ',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: screenWidth * 0.035,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Cliquez ici',
                                                style: TextStyle(
                                                  color: const Color(
                                                    0xFFD32F2F,
                                                  ), // Rouge
                                                  fontWeight: FontWeight.bold,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
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
                    ),
                  ],
                ),

                // Bouton retour
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: MediaQuery.of(context).size.width * 0.04,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  //   Widget _buildTextField({
  //     required TextEditingController controller,
  //     required String hint,
  //     required IconData icon,
  //     bool isPassword = false,
  //     TextInputType keyboardType = TextInputType.text,
  //     String? Function(String?)? validator,
  //   }) {
  //     return TextFormField(
  //       controller: controller,
  //       obscureText: isPassword && _obscurePassword,
  //       keyboardType: keyboardType,
  //       validator: validator,
  //       style: const TextStyle(color: Colors.white),
  //       decoration: InputDecoration(
  //         hintText: hint,
  //         hintStyle: TextStyle(color: Colors.white38),
  //         filled: true,
  //         fillColor: const Color(0xFF2A2A2A),
  //         prefixIcon: Icon(icon, color: const Color(0xFFFFEB3B)),
  //         suffixIcon: isPassword
  //             ? IconButton(
  //                 icon: Icon(
  //                   _obscurePassword ? Icons.visibility_off : Icons.visibility,
  //                   color: Colors.white54,
  //                 ),
  //                 onPressed: () {
  //                   setState(() => _obscurePassword = !_obscurePassword);
  //                 },
  //               )
  //             : null,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: BorderSide.none,
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: const BorderSide(color: Color(0xFF3A3A3A), width: 1),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: const BorderSide(color: Color(0xFFFFEB3B), width: 2),
  //         ),
  //         errorBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(15),
  //           borderSide: const BorderSide(color: Color(0xFFD32F2F), width: 1),
  //         ),
  //         contentPadding: const EdgeInsets.symmetric(
  //           horizontal: 20,
  //           vertical: 18,
  //         ),
  //       ),
  //     );
  //   }
  // }
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    VoidCallback? onTogglePassword, // ← NOUVEAU : Pour le toggle
    bool obscureText = true, // ← NOUVEAU : Par défaut masqué pour les passwords
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword
          ? obscureText
          : false, // ← Utilise le paramètre correctement
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF2A2A2A),
        prefixIcon: Icon(icon, color: const Color(0xFFFFEB3B)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white54,
                ),
                onPressed: onTogglePassword, // ← Utilise le callback
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF3A3A3A), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFFFEB3B), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD32F2F), width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }
}
