import 'package:farmeasy/methods/product_provider.dart';
import 'package:farmeasy/screens/Farmer%20Screens/farmer_home_screen.dart';
import 'package:farmeasy/screens/Farmer%20Screens/stats_screen.dart';
import 'package:farmeasy/screens/Farmer%20Screens/truck_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainFarmerScreen extends StatefulWidget {
  const MainFarmerScreen({Key? key}) : super(key: key);

  @override
  State<MainFarmerScreen> createState() => _MainFarmerScreenState();
}

class _MainFarmerScreenState extends State<MainFarmerScreen> {
  PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).productList;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (value) {
          _controller.animateToPage(
            value,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutCubic,
          );
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fire_truck_outlined,
            ),
            label: 'Trucks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart,
            ),
            label: 'Stats',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FarmEasy',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('images/logo.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        controller: _controller,
        children: const [
          FarmerHomeScreen(),
          TruckScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
