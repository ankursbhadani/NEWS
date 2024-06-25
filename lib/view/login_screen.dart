import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/model/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Button elevatedButton =Button();
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("WELCOME BACK",style: GoogleFonts.firaSansCondensed(textStyle:const TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),),

            const Text("Please log in to continue",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
            const SizedBox(height: 16,),
            elevatedButton.button(
              onTap: (){},
              title: 'Email',
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              icons: Icons.email_outlined,
            ),
            const SizedBox(height: 8,),
            elevatedButton.button(
              onTap: (){},
              title: 'Google',
              backgroundColor: const Color(0XFFF42727),
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              icons:FontAwesomeIcons.google,
            ),
            const SizedBox(height: 8,),

            elevatedButton.button(
              onTap: (){},
              title: 'Facebook',
              backgroundColor: Colors.blueAccent.shade200,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              icons: FontAwesomeIcons.facebook,
            ),
            const SizedBox(height: 8,),

            elevatedButton.button(
              onTap: (){},
              title: 'Twitter',
              backgroundColor: Colors.lightBlueAccent.shade400,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              icons: FontAwesomeIcons.twitter,
            ),
          const SizedBox(height: 25,),
          const Center(
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
          ),
          ],
        ),
      ),
    ));
  }
}
