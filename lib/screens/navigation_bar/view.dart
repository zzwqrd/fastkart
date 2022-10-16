import 'package:fastkart_app/helper/app_theme.dart';
import 'package:fastkart_app/screens/home_screen/view.dart';
import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({Key? key}) : super(key: key);

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  void _openEndDrawer() {
    _drawerKey.currentState!.openEndDrawer();
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const Text("1"),
    const Text("2"),
    const Text("3"),
    const Text("4"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      print('>>>>>>>>>>>>>>>>>>>>>. $index');
    });
  }

  @override
  void initState() {
    _onItemTapped(currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        elevation: 20.0,
        backgroundColor: AppTheme.mainColor,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            activeIcon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            activeIcon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            activeIcon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            activeIcon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            activeIcon: Image.asset(
              'assets/icons/bg-pattern2.png',
              width: 20,
            ),
            label: 'Cart',
          ),
        ],
        // onTap: (index) {
        //   // cubit.changeBottomNavigationBar(index);
        //   setState(() {
        //     currentIndex = index;
        //   });
        // },
        onTap: _onItemTapped,
      ),
    );
  }
}
