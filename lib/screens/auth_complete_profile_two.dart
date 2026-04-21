import 'package:carli_internship_management/widgets/green_button_widget.dart';
import 'package:carli_internship_management/widgets/select_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carli_internship_management/widgets/input_bar_widget.dart';
import 'package:carli_internship_management/widgets/input_line_widget.dart';
import 'package:carli_internship_management/widgets/white_button_widget.dart';
import 'package:carli_internship_management/widgets/step_slide_widget.dart';
import 'package:carli_internship_management/widgets/pdf_upload_box_widget.dart';
import 'package:carli_internship_management/widgets/select_box_widget.dart';
import 'package:carli_internship_management/widgets/image_upload_box_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

class AuthCompleteProfileTwo extends StatefulWidget {
  const AuthCompleteProfileTwo({super.key});

  @override
  State<AuthCompleteProfileTwo> createState() => _AuthCompleteProfileTwoState();
}

class _AuthCompleteProfileTwoState extends State<AuthCompleteProfileTwo> {
  final _formKey = GlobalKey<FormState>();
  final _skillsController = TextEditingController();
  final _previousInternshipsController = TextEditingController();
  final _linkedInController = TextEditingController();
  final _githubController = TextEditingController();
  final _languagesController = TextEditingController();
  bool _isChecked = false;


  void _handleSignUp() {
    if(!mounted) return;

    if (_formKey.currentState!.validate()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing...')),
          );
          context.push('/complete-profile-three');
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 393),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 3.0
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 10),
                                  SvgPicture.asset(
                                    'assets/2026_04_19_CarLi_ET_Logo_Finished.svg',
                                    width: 74.32,
                                    height: 35,
                                    placeholderBuilder: (context) => const CircularProgressIndicator(),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                      width: 200,
                                      child: Text(
                                          "CarLi_ET Internship Management",
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          )
                                      )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 19),
                              StepSlideWidget(
                                  currentStep: 2
                              ),
                              SizedBox(height: 29),
                              Text(
                                'Complete your profile',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(0, 94, 94, 100),
                                ),
                              ),
                              SizedBox(height: 29),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InputBarWidget(
                                        label: 'Skills',
                                        hintText: 'Enter your skills'
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        SizedBox(width: 27),
                                        PdfUploadBoxWidget(
                                            label: "Resume / CV"
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    InputLineWidget(
                                        label: "LinkedIn URL",
                                        hintText: "LinkedIn URL"
                                    ),
                                    SizedBox(height: 8),
                                    InputLineWidget(
                                        label: "Portfolio / GitHub",
                                        hintText: "URL (Portfolio / GitHub)"
                                    ),
                                    SizedBox(height: 8),
                                    InputLineWidget(
                                        label: "Languages",
                                        hintText: "English"
                                    ),
                                    SizedBox(height: 20),
                                    InputBarWidget(
                                        label: 'Previous Internships (Optional)',
                                        hintText: 'Enter your previous internships'
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 65),
                                  WhiteButtonWidget(
                                      onPressed: () {
                                        context.go('/complete-profile-one');
                                      },
                                      buttonText: 'Go Back',
                                      width: 105.35,
                                      height: 36.39
                                  ),
                                  SizedBox(width: 12),
                                  GreenButtonWidget(
                                      onPressed: _handleSignUp,
                                      buttonText: 'Next    >',
                                      width: 105.35,
                                      height: 36.39
                                  )
                                ],
                              ),
                              SizedBox(height: 40),
                            ]
                        ),
                      )
                  )),
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    _skillsController.dispose();
    _githubController.dispose();
    _linkedInController.dispose();
    _languagesController.dispose();
    _previousInternshipsController.dispose();
    super.dispose();
  }
}