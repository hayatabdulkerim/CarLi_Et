import 'package:carli_internship_management/widgets/green_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carli_internship_management/widgets/input_bar_widget.dart';
import 'package:carli_internship_management/widgets/white_button_widget.dart';

class AuthSignUpPage extends StatefulWidget {
  const AuthSignUpPage({super.key});

  @override
  State<AuthSignUpPage> createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends State<AuthSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (!_isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the Terms and Privacy')),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing...')),
      );
      // Ensure the widget is still in the tree before navigating
      if (mounted) {
        context.push('/complete-profile-one');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 393),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3.0),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            'assets/2026_04_19_CarLi_ET_Logo_Finished.svg',
                            width: 74.32,
                            height: 35,
                            placeholderBuilder: (context) => const CircularProgressIndicator(),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 200,
                            child: Text.rich(
                              TextSpan(
                                text: "CarLi_ET ",
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF747474),
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Internship Management",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 38),
                      const Text(
                        'Create a new account',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 94, 94, 1.0), // Corrected opacity (1.0)
                        ),
                      ),
                      const SizedBox(height: 29),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            InputBarWidget(
                              label: "First Name",
                              hintText: "Enter your first name",
                              width: 313,
                              height: 50,
                              controller: _firstNameController,
                              validator: (value) => (value == null || value.isEmpty) ? 'Please enter your first name' : null,
                            ),
                            const SizedBox(height: 16),
                            InputBarWidget(
                              label: "Last Name",
                              hintText: "Enter your last name",
                              width: 313,
                              height: 50,
                              controller: _lastNameController,
                              validator: (value) => (value == null || value.isEmpty) ? 'Please enter your last name' : null,
                            ),
                            const SizedBox(height: 16),
                            InputBarWidget(
                              label: "Password",
                              hintText: "Enter your password",
                              width: 313,
                              height: 50,
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Please enter a password';
                                if (value.length < 8) return 'At least 8 characters required';
                                if (!value.contains(RegExp(r'[A-Z]'))) return 'Need one uppercase letter';
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            InputBarWidget(
                              label: 'Re-enter Password',
                              hintText: "Re-enter your password",
                              width: 313,
                              height: 50,
                              obscureText: true,
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value != _passwordController.text) return 'Passwords do not match';
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            CheckboxListTile(
                              title: Text.rich(
                                TextSpan(
                                  text: "I agree with ",
                                  style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                                  children: const [
                                    TextSpan(text: "Terms", style: TextStyle(color: Color(0xFF008080))),
                                    TextSpan(text: " and ", style: TextStyle(color: Colors.black)),
                                    TextSpan(text: "Privacy", style: TextStyle(color: Color(0xFF008080))),
                                  ],
                                ),
                              ),
                              value: _isChecked,
                              onChanged: (bool? newValue) => setState(() => _isChecked = newValue ?? false),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                            const SizedBox(height: 24),
                            GreenButtonWidget(
                              onPressed: _handleSignUp,
                              buttonText: 'Create Account',
                              width: 193.15,
                              height: 36,
                            ),
                            const SizedBox(height: 8),
                            WhiteButtonWidget(
                              onPressed: () => context.pop(),
                              buttonText: "Go Back",
                              width: 193.15,
                              height: 36,
                            ),
                            const SizedBox(height: 40),
                          ],
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
    );
  }
}
