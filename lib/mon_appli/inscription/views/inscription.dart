import 'package:flutter/material.dart';
import 'package:groupe_samuel_appli/mon_appli/home/views/home.dart';
import 'package:groupe_samuel_appli/mon_appli/login/view/login.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _acceptTerms = false;
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
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
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
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleInscription() async {
    if (_formKey.currentState!.validate()) {
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez accepter les conditions d\'utilisation'),
            backgroundColor: Color(0xFFD32F2F),
          ),
        );
        return;
      }

      setState(() => _isLoading = true);

      // TODO: Ajouter votre appel API ici
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      // Exemple de navigation après inscription réussie
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));
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
                  left: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD32F2F).withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  right: -100,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF2E7D32).withOpacity(0.3),
                    ),
                  ),
                ),

                // Contenu principal
                Column(
                  children: [
                    SizedBox(height: screenHeight * 0.04),

                    // Titre animé
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'INSCRIPTION',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFEB3B), // Jaune
                          letterSpacing: 2,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.03),

                    // Container noir arrondi
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
                                vertical: screenHeight * 0.03,
                              ),
                              child: Form(
                                key: _formKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Nom
                                      _buildLabel('Nom :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _nomController,
                                        hint: 'Entrez votre nom',
                                        icon: Icons.person_outline,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez entrer votre nom';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Prénom
                                      _buildLabel('Prénom :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _prenomController,
                                        hint: 'Entrez votre prénom',
                                        icon: Icons.person,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez entrer votre prénom';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Email
                                      _buildLabel('Email :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _emailController,
                                        hint: 'exemple@email.com',
                                        icon: Icons.email_outlined,
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez entrer votre email';
                                          }
                                          if (!value.contains('@')) {
                                            return 'Email invalide';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Téléphone
                                      _buildLabel('Téléphone :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _telephoneController,
                                        hint: '+226 XX XX XX XX',
                                        icon: Icons.phone_outlined,
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez entrer votre téléphone';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Password
                                      _buildLabel('Mot de passe :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _passwordController,
                                        hint: 'Minimum 6 caractères',
                                        icon: Icons.lock_outline,
                                        isPassword: true,
                                        obscureText: _obscurePassword,
                                        onTogglePassword: () {
                                          setState(() => _obscurePassword = !_obscurePassword);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez entrer un mot de passe';
                                          }
                                          if (value.length < 6) {
                                            return 'Minimum 6 caractères';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Champ Confirmer Password
                                      _buildLabel('Confirmer le mot de passe :'),
                                      SizedBox(height: screenHeight * 0.01),
                                      _buildTextField(
                                        controller: _confirmPasswordController,
                                        hint: 'Retapez votre mot de passe',
                                        icon: Icons.lock,
                                        isPassword: true,
                                        obscureText: _obscureConfirmPassword,
                                        onTogglePassword: () {
                                          setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Veuillez confirmer votre mot de passe';
                                          }
                                          if (value != _passwordController.text) {
                                            return 'Les mots de passe ne correspondent pas';
                                          }
                                          return null;
                                        },
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Checkbox accepter conditions
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _acceptTerms,
                                            onChanged: (value) {
                                              setState(() => _acceptTerms = value ?? false);
                                            },
                                            activeColor: const Color(0xFF2E7D32),
                                            checkColor: Colors.white,
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() => _acceptTerms = !_acceptTerms);
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'J\'accepte les ',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: screenWidth * 0.035,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: 'conditions d\'utilisation',
                                                      style: TextStyle(
                                                        color: const Color(0xFFFFEB3B),
                                                        fontWeight: FontWeight.bold,
                                                        decoration: TextDecoration.underline,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: screenHeight * 0.03),

                                      // Bouton S'inscrire
                                      SizedBox(
                                        width: double.infinity,
                                        height: 55,
                                        child: ElevatedButton(
                                          onPressed: _isLoading ? null : _handleInscription,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFFFEB3B), // Jaune
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            elevation: 5,
                                          ),
                                          child: _isLoading
                                              ? const SizedBox(
                                                  height: 25,
                                                  width: 25,
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 3,
                                                    valueColor: AlwaysStoppedAnimation<Color>(
                                                      Color(0xFF1B5E20),
                                                    ),
                                                  ),
                                                )
                                              : Text(
                                                  'S\'inscrire',
                                                  style: TextStyle(
                                                    fontSize: screenWidth * 0.045,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(0xFF1B5E20),
                                                  ),
                                                ),
                                        ),
                                      ),

                                      SizedBox(height: screenHeight * 0.02),

                                      // Déjà un compte
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                                            // Navigator.pop(context);
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Vous avez déjà un compte ? ',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: screenWidth * 0.035,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Se connecter',
                                                  style: TextStyle(
                                                    color: const Color(0xFFD32F2F), // Rouge
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: screenHeight * 0.02),
                                    ],
                                  ),
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
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onTogglePassword,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && obscureText,
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
                onPressed: onTogglePassword,
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
    );
  }
}