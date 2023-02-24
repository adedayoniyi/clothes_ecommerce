import 'package:clothes_ecommerce/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text("Page 2"),
    ),
    const Center(
      child: Text("Page 3"),
    ),
    const Center(
      child: Text("Page 4"),
    ),
  ];

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
                        "Home",
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
                        "Home",
                        style: TextStyle(
                          color: Color(0xFF9775FA),
                        ),
                      ),
                    )
                  : const Icon(Icons.account_balance_wallet_outlined),
              label: "",
            )
          ],
        ));
  }
}
