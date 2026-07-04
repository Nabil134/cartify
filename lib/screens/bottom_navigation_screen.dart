import 'package:cartify/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    return Scaffold(
      /*bottomNavigationBar start here*/
      bottomNavigationBar:navProvider.isDrawerOpen ?null: BottomNavigationBar(
        currentIndex: navProvider.currentIndex,
        onTap: (index) => navProvider.changeIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),
            label: "Home"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),
            label: "Favorite"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag,),
            label: "Cart",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person,),
            label: "Profile",
          ),
        ],
      ),
      /*bottomNavigationBar end here*/
      body: navProvider.pages[navProvider.currentIndex],
    );
  }
}
