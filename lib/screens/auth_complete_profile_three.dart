import 'package:carli_internship_management/widgets/green_button_widget.dart';
import 'package:carli_internship_management/widgets/select_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carli_internship_management/widgets/input_bar_widget.dart';
import 'package:carli_internship_management/widgets/white_button_widget.dart';
import 'package:carli_internship_management/widgets/step_slide_widget.dart';
import 'package:carli_internship_management/widgets/select_box_widget.dart';
import 'package:carli_internship_management/widgets/image_upload_box_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

class AuthCompleteProfileThree extends StatefulWidget {
  const AuthCompleteProfileThree({super.key});

  @override
  State<AuthCompleteProfileThree> createState() => _AuthCompleteProfileThreeState();
}

class _AuthCompleteProfileThreeState extends State<AuthCompleteProfileThree> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _expectedYearController = TextEditingController();
  final _gpaController = TextEditingController();
  bool _isChecked = false;


  void _handleSignUp() {
    if(!mounted) return;

    if (!_isChecked) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please accept the Terms and Privacy')),
          );
        }
      });
      return;
    }

    if (_formKey.currentState!.validate()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing...')),
          );
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
                                currentStep: 3
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
                            Container(
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      spacing: 8,
                                      children: [
                                        SelectBoxWidget(
                                            label: "Work Authorization",
                                            hintText: "Citizen, Permanent Resident, etc...",
                                            width: double.infinity,
                                            height: double.infinity,
                                            items: ["Citizen", "Permanent Resident", "Work visa holder", "Temporary Resident with work permit"]
                                        ),
                                        SelectBoxWidget(
                                            label: "Need visa sponsorship?",
                                            hintText: "Yes / No",
                                            width: double.infinity,
                                            height: double.infinity,
                                            items: ["Yes", "No"]
                                        ),
                                        SelectBoxWidget(
                                            label: "Gender",
                                            hintText: "Male / Female",
                                            width: double.infinity,
                                            height: double.infinity,
                                            items: ["Male", "Female"]
                                        ),
                                        SelectBoxWidget(
                                            label: "Disability status",
                                            hintText: "Yes / No",
                                            width: double.infinity,
                                            height: double.infinity,
                                            items: ["Yes", "No"]
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 65),
                                WhiteButtonWidget(
                                    onPressed: () {
                                      context.push('/complete-profile-two');
                                    },
                                    buttonText: 'Go Back',
                                    width: 105.35,
                                    height: 36.39
                                ),
                                SizedBox(width: 12),
                                GreenButtonWidget(
                                    onPressed: () {},
                                    buttonText: 'Next    >',
                                    width: 105.35,
                                    height: 36.39
                                )
                              ],
                            ),
                            SizedBox(height: 40)
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _expectedYearController.dispose();
    _gpaController.dispose();
    super.dispose();
  }
}