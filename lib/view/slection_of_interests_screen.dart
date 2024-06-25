import 'package:flutter/material.dart';
import 'package:news/model/logo.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/view/dashboard.dart';
import 'package:news/view/login_screen.dart';
import '../data/interests.dart';

class SelectInterests extends StatefulWidget {
  const SelectInterests({Key? key}) : super(key: key);

  @override
  State<SelectInterests> createState() => _SelectInterestsState();
}

class _SelectInterestsState extends State<SelectInterests> {
  Logo logo = Logo();
  List<String> selectedInterests = [];
  bool isButtonEnabled = false;
  int requiredSelections = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          titleSpacing: 10.0,
          title: Text(
            "FLIPBOARD",
            style: GoogleFonts.firaSansCondensed(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: FittedBox(
              fit: BoxFit.contain,
              child: logo.logo(color: Colors.white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                height: 35,
                width: 80,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));
                  }, // Always clickable
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFF42727),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.1,
                    blurRadius: 0.1,
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              height: 1.0,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24, top: 0, bottom: 0),
                  child: ElevatedButton(
                    onPressed: isButtonEnabled ? () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));
                    } : (){
                      print("on continue $isButtonEnabled");

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonEnabled ? const Color(0XFFF42727) : Colors.red.shade300,
                      foregroundColor: isButtonEnabled ? Colors.white : Colors.white70,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: Text(
                      selectedInterests.isEmpty
                          ? "Choose at least $requiredSelections to continue"
                          : selectedInterests.length < requiredSelections
                          ? "Choose ${requiredSelections - selectedInterests.length} more to continue"
                          : "Continue",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By continuing, you accept the",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Terms of Use and Privacy Policy.",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                        fontSize: 11,
                        decorationColor: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 20, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "WHAT INTERESTS YOU?",
                  style: GoogleFonts.firaSansCondensed(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                subtitle: const Text(
                  "Follow #Topics to influence the stories you see",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 5, right: 16),
                    child: Wrap(
                      spacing: 8.0, // Space between items horizontally
                      runSpacing: 11.0, // Space between lines
                      children: interests.map((interest) {
                        bool isSelected = selectedInterests.contains(interest);

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedInterests.remove(interest);
                              } else {
                                selectedInterests.add(interest);
                              }
                              updateButtonState();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0XFFF42727) : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: '# ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: interest.replaceAll('#', ''),
                                    style: GoogleFonts.firaSansCondensed(
                                      textStyle: TextStyle(
                                        fontSize: 17.0,
                                        color: isSelected ? Colors.white : Colors.black45,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = selectedInterests.length >= requiredSelections;
    });
  }
}
