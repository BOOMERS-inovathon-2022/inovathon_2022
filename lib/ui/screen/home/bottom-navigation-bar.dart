import 'package:flutter/material.dart';
import 'package:inovathon_2022/ui/screen/categories/categories_page.dart';
import 'package:inovathon_2022/ui/screen/home/home_page.dart';
import 'package:inovathon_2022/ui/screen/seller_profile/seller_profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var pages = [
    HomePage(),
    const CategoriesPage(),
    const SellerProfile(seller: null)
  ];
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.lightGreen,
            iconSize: 26,
            selectedItemColor: Colors.brown,
            unselectedItemColor: Colors.white,
            currentIndex: current_index,
            selectedFontSize: 16.0,
            unselectedFontSize: 12,
            onTap: (int i) => {
              setState(
                () {
                  current_index = i;
                },
              ),
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: "Início",
                  tooltip: "Home"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.category),
                  icon: Icon(Icons.category_outlined),
                  label: "Categorias",
                  tooltip: "Search"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: "Perfil",
                  tooltip: "Settings"),
            ],
          ),
        ),
      ),
      body: pages[current_index],
    );
  }
}
