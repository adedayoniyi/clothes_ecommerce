import 'package:clothes_ecommerce/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-bar';

  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text("Wishhlist"),
    ),
    const Center(
      child: Text("Shopping bag"),
    ),
    const Center(
      child: Text("Wallet"),
    ),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
              icon: _page == 0
                  ? const Padding(
                      padding: EdgeInsets.only(top: 17),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: Color(0xFF9775FA),
                        ),
                      ),
                    )
                  : const Icon(Icons.home_outlined),
              label: ""),
          BottomNavigationBarItem(
            icon: _page == 1
                ? const Padding(
                    padding: EdgeInsets.only(top: 17),
                    child: Text(
                      "Wishlist",
                      style: TextStyle(
                        color: Color(0xFF9775FA),
                      ),
                    ),
                  )
                : const Icon(Icons.favorite_border_sharp),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _page == 2
                ? const Padding(
                    padding: EdgeInsets.only(top: 17),
                    child: Text(
                      "Bag",
                      style: TextStyle(
                        color: Color(0xFF9775FA),
                      ),
                    ),
                  )
                : const Icon(Icons.shopping_bag_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _page == 3
                ? const Padding(
                    padding: EdgeInsets.only(top: 17),
                    child: Text(
                      "Wallet",
                      style: TextStyle(
                        color: Color(0xFF9775FA),
                      ),
                    ),
                  )
                : const Icon(Icons.account_balance_wallet_outlined),
            label: "",
          )
        ],
      ),
    );
  }
}
