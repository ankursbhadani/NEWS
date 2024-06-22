import 'package:flutter/material.dart';
import 'package:news/model/logo.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  onPressed: () {}, // Always clickable
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      runSpacing: 12.0, // Space between lines
                      children: interests.map((interest) {
                        bool isSelected = selectedInterests.contains(interest);
                        bool shouldWrap = interest.replaceAll('#', '').length > 15;

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
                            constraints: BoxConstraints(
                              maxWidth: screenWidth -48,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0XFFF42727) : Colors.grey.shade200,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '# ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: isSelected ? Colors.white : Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: interest.replaceAll('#', ''),
                                    style: GoogleFonts.firaSansCondensed(
                                      textStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: isSelected ? Colors.white : Colors.black45,
                                        fontWeight: FontWeight.bold,
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
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 0, bottom: 0),
                  child: ElevatedButton(
                    onPressed: isButtonEnabled ? () {} : (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isButtonEnabled ? const Color(0XFFF42727) : Colors.red.shade300,
                      foregroundColor: isButtonEnabled ? Colors.white : Colors.white70,
                      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: const Text(
                      "Choose at least 3 to continue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled = selectedInterests.length >= 3;
    });
  }
}
