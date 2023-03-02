import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Personal Details",
      "My Order",
      "My Favourites",
      "Shipping Address",
      "My Card",
      "Settings",
    ];
    List<IconData> icons = [
      Icons.person,
      Icons.shopping_bag,
      Icons.favorite,
      Icons.car_rental,
      Icons.card_travel,
      Icons.settings
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffDDDDDD),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Animate(
                            effects: const [
                              SlideEffect(
                                begin: Offset(0, -0.5),
                                end: Offset(0, 0),
                              ),
                              FadeEffect(begin: 0, end: 1),
                            ],
                            child: Text(
                              "Jeet Dalal",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Animate(
                            effects: const [
                              SlideEffect(
                                begin: Offset(0, -0.5),
                                end: Offset(0, 0),
                              ),
                              FadeEffect(begin: 0, end: 1),
                            ],
                            child: Text(
                              FirebaseAuth.instance.currentUser!.email ??
                                  "No user",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: List.generate(
                      6,
                      (index) => Animate(
                        effects: const [
                          SlideEffect(
                            begin: Offset(-2, 0),
                            end: Offset(0, 0),
                            curve: Curves.easeIn,
                          ),
                        ],
                        delay: Duration(
                          milliseconds: 100 + 100 * index,
                        ),
                        child: ListTile(
                          trailing: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                          title: Text(
                            categories[index],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffDDDDDD),
                            ),
                            child: Center(
                              child: Icon(
                                icons[index],
                                color: Colors.black,
                              ),
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
        ),
      ),
    );
  }
}
