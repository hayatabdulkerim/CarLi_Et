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

class AuthCompleteProfileOne extends StatefulWidget {
  const AuthCompleteProfileOne({super.key});

  @override
  State<AuthCompleteProfileOne> createState() => _AuthCompleteProfileOneState();
}

class _AuthCompleteProfileOneState extends State<AuthCompleteProfileOne> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _expectedYearController = TextEditingController();
  final _gpaController = TextEditingController();
  bool _isChecked = false;


  void _handleSignUp() {
    if(!mounted) return;

    if (_formKey.currentState!.validate()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing...')),
          );
          context.push('/complete-profile-two');
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
                                currentStep: 1
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
                              child: GridView.count(
                                shrinkWrap: true,                        // Add this: tells Grid to be only as tall as its content
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 9,
                                mainAxisSpacing: 0,
                                padding: const EdgeInsets.all(5),
                                children: [
                                  Column(
                                    children: [
                                      ImageUploadBoxWidget(
                                        label: "Profile Image"
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InputBarWidget(
                                          label: "First Name",
                                          hintText: "Enter your first name",
                                          controller: _firstNameController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your first name';
                                            }
                                            return null;
                                          }
                                      ),
                                      InputBarWidget(
                                          label: "Last Name",
                                          hintText: "Enter your last name",
                                          controller: _lastNameController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your last name';
                                            }
                                            return null;
                                          }
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SelectBoxWidget(
                                          label: 'University / Institution',
                                          hintText: "Choose university",
                                          width: 158,
                                          height: 37.4,
                                          items: ['Addis Ababa University', 'Jimma University', 'Unity University', 'Haramaya University', 'Adama Science and Technology University']
                                      ),
                                      InputBarWidget(
                                          label: "Expected Year of Graduation",
                                          hintText: "2018 E.C. / 2026 G.C.",
                                          controller: _expectedYearController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty || value.contains(RegExp(r'[A-Z]')) || value.contains(RegExp(r'[a-z]')) || value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) || value.length != 4) {
                                              return 'Please enter a valid year.';
                                            }
                                            return null;
                                          }
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 125),
                                      SelectBoxWidget(
                                          label: 'Year of Study',
                                          hintText: "1st Year",
                                          width: 158,
                                          height: 37.4,
                                          items: ['Freshman (1st Year)', '2nd Year', '3rd Year', '4th Year', '5th Year']
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InputBarWidget(
                                          label: "Current GPA (Optional)",
                                          hintText: "GPA",
                                          controller: _gpaController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty || value.contains(RegExp(r'[A-Z]')) || value.contains(RegExp(r'[a-z]')) || value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) || double.parse(value) <= 0.0 || double.parse(value) >= 4.0) {
                                              return 'Please enter a valid GPA';
                                            }
                                            return null;
                                          }
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(width: 65),
                                WhiteButtonWidget(
                                    onPressed: () {
                                      context.go('/signup');
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