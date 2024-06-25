import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/dummynews.dart';
import 'package:news/model/logo.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Logo logo = Logo();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "FOR YOU",
                      style: GoogleFonts.firaSansCondensed(
                        textStyle: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Stack(
                  children: [
                    Text(
                      "EXPLORE MORE TOPICS",
                      style: GoogleFonts.firaSansCondensed(
                        textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 0,
                      bottom: 0,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                          child: Container(
                            width: 16,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 14.0),
                child: Container(
                  height: 60,
                  width: 20,
                  child: const Icon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            SizedBox(
              height: 60,
              child: BottomNavigationBar(

                showSelectedLabels:false ,
                showUnselectedLabels: false,
                iconSize: 25,
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.solidUser,size: 20,),
                    label: '',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 5,
                height: 4,
                color: Colors.red,
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 5 * _selectedIndex,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.red,
                  ),
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.orange,
                  ),
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.green,
                  ),
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.indigo,
                  ),
                  Container(
                    height: 3.5,
                    width: 16,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(dummyNews[0].imageUrl),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.transparent.withOpacity(0.07),
                      child: const Icon(
                        FontAwesomeIcons.sliders,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SizedBox(
                      height: 200,
                      width: 250,
                      child: logo.logo(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 2,
                    bottom: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: ListTile(
                        title: Text(
                          dummyNews[0].heading,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.firaSansCondensed(
                            textStyle: TextStyle(
                              backgroundColor: Colors.black12,
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              dummyNews[0].source,
                              style: GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              " ∙4h",
                              style: GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 130,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              child: const Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                color: Colors.white,
                                size: 20,
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(dummyNews[1].imageUrl),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          dummyNews[1].heading,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              dummyNews[1].source,
                              style: GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              " ∙6h",
                              style: GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 130,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              child: const Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                size: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(dummyNews[2].imageUrl),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          dummyNews[2].heading,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              dummyNews[2].source,
                              style

                                  : GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              " ∙7h",
                              style: GoogleFonts.firaSansCondensed(
                                textStyle: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                    height: 130,
                                    width: double.infinity,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              child: const Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                size: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



