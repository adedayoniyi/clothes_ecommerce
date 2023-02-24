import 'package:clothes_ecommerce/constants/global_variables.dart';
import 'package:clothes_ecommerce/preferences/theme_manager.dart';
import 'package:clothes_ecommerce/preferences/theme_notifier.dart';
import 'package:clothes_ecommerce/providers/user_provider.dart';
import 'package:clothes_ecommerce/widgets/brand_categories.dart';
import 'package:clothes_ecommerce/widgets/custom_drawer.dart';
import 'package:clothes_ecommerce/widgets/general_circular_button.dart';
import 'package:clothes_ecommerce/widgets/products_grid.dart';
import 'package:clothes_ecommerce/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  var _darkTheme = false;
  bool isRotate = true;
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final theme = Provider.of<ThemeNotifier>(context);
    _darkTheme = (theme.getTheme() == darkTheme);
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      key: _key,
      drawer: isMobile ? const CustomDrawer() : null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralCircularButton(
                    backgroundColor: _darkTheme
                        ? const Color(0xFF222E34)
                        : const Color(0xFFF5F6FA),
                    onPressed: () {
                      _key.currentState!.openDrawer();
                      setState(() {
                        isRotate = false;
                      });
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  GeneralCircularButton(
                    backgroundColor: _darkTheme
                        ? const Color(0xFF222E34)
                        : const Color(0xFFF5F6FA),
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Hemendra",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Welcome to Laza",
                style: TextStyle(fontSize: 15, color: Color(0xFF8F959E)),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: SearchField(),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Choose Brand",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                height: 55,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return BrandCategories(
                        icon: GlobalVariables.categoryImages[index]["image"]!,
                        brandName: GlobalVariables.categoryImages[index]
                            ["title"]!);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "New Arrival",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text("View All")
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 2 : 4,
                  childAspectRatio: 0.77,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const ProductGrid(
                    price: '100',
                    productName: 'Nike Sportswear club',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
