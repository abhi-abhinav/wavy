import 'package:wavy/consts/consts.dart';
import 'package:wavy/controllers/home_controller.dart';
import 'package:wavy/views/cart_screen/cart_screen.dart';
import 'package:wavy/views/category_screen/category_screen.dart';
import 'package:wavy/views/home_screen/home_screen.dart';
import 'package:wavy/views/profile_screen/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
// call home container
    var controller = Get.put(HomeController());
    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: GNav(
            gap: 8,
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconSize: 24,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              GButton(
                icon: Icons.category,
                text: 'Category',
                iconSize: 24,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              GButton(
                icon: Icons.shopping_cart_rounded,
                text: 'Cart',
                iconSize: 24,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              GButton(
                icon: Icons.account_circle_sharp,
                iconSize: 24,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                iconColor: Colors.white,
                textColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
            ],
            selectedIndex: controller.currentNavIndex.value,
            onTabChange: (index) {
              controller.currentNavIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
