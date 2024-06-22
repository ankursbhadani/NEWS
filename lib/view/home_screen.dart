import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:news/model/logo.dart';
import 'package:news/view/slection_of_interests_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Logo logo = Logo();
    return Scaffold(
      backgroundColor: const Color(0XFF404E5B),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 170),
            logo.logo(color: const Color(0XFF404E5B)),
            const SizedBox(height: 50),
             Text(
              "DISCOVER AND SHARE",
              style: GoogleFonts.firaSansCondensed(textStyle:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            ),
            Text(
              "THE STORIES THAT",
              style: GoogleFonts.firaSansCondensed(textStyle:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Text(
                      "MATTER",
                      style: GoogleFonts.firaSansCondensed(textStyle:const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    Positioned(
                      bottom: 4, // Adjust this value to control the distance
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 4,
                        width: 200,
                        color: Color(0XFF9FC4E3),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 7),
                 Text(
                  "TO YOU",
                  style: GoogleFonts.firaSansCondensed(textStyle:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 260,),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelectInterests()));
              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))

              ), child: const Text("Get started",style: TextStyle(fontWeight: FontWeight.bold),),),
            )
          ],
        ),
      ),
    );
  }
}
