import 'dart:async';

import 'package:ecomerce/models/product_data.dart';
import 'package:ecomerce/screens/category/category_products_screen.dart';
import 'package:ecomerce/screens/notifications/notifications_screen.dart';
import 'package:ecomerce/screens/profile/profile_screen.dart';
import 'package:ecomerce/screens/products/all_products_screen.dart';
import 'package:ecomerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<String> _bannerImages = [
    'assets/images/electronic_banner.jpg',
    'assets/images/kitchen_banner.jpg',
    'assets/images/medicine_banner.jpg',
  ];

  final PageController _bannerController = PageController();
  Timer? _bannerTimer;
  int _currentBanner = 0;
  int _selectedNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _bannerTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_bannerController.hasClients) return;

      final nextPage = (_currentBanner + 1) % _bannerImages.length;
      _bannerController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  void _openCategory(ProductCategory category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryProductsScreen(category: category),
      ),
    );
  }

  ProductCategory _categoryByName(String name) {
    return productCategories.firstWhere((category) => category.title == name);
  }

  void _openNotifications() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
      ),
    );
  }

  Future<void> _onBottomNavTap(int index) async {
    if (index == 0) {
      setState(() {
        _selectedNavIndex = 0;
      });
      return;
    }

    setState(() {
      _selectedNavIndex = index;
    });

    Widget screen;
    if (index == 1) {
      screen = const AllProductsScreen();
    } else if (index == 2) {
      screen = const NotificationsScreen();
    } else {
      screen = const ProfileScreen();
    }

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );

    if (!mounted) return;
    setState(() {
      _selectedNavIndex = 0;
    });
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Category',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: categories.map((category) {
                  return ActionChip(
                    label: Text(category.name),
                    backgroundColor: const Color(0xFFF6F6F6),
                    side: const BorderSide(color: Color(0xFFE4E4E4)),
                    onPressed: () {
                      Navigator.pop(context);
                      _openCategory(_categoryByName(category.name));
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Price',
                style: TextStyle(
                  color: Color(0xFF4A4A4A),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ActionChip(
                    label: const Text('Under Rs. 500'),
                    backgroundColor: const Color(0xFFF6F6F6),
                    side: const BorderSide(color: Color(0xFFE4E4E4)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ActionChip(
                    label: const Text('Rs. 500 - Rs. 2,000'),
                    backgroundColor: const Color(0xFFF6F6F6),
                    side: const BorderSide(color: Color(0xFFE4E4E4)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ActionChip(
                    label: const Text('Above Rs. 2,000'),
                    backgroundColor: const Color(0xFFF6F6F6),
                    side: const BorderSide(color: Color(0xFFE4E4E4)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/icons/logo.jpg',
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'E-commerce Platform',
                        style: TextStyle(
                          color: Color(0xFF222222),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          onPressed: _openNotifications,
                          icon: const Icon(
                            Icons.notifications_none_outlined,
                            color: Color(0xFF4A4A4A),
                            size: 29,
                          ),
                        ),
                        Positioned(
                          top: 3,
                          right: 5,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE83A2E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              '10',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Search section
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.25),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xFFB5B5B5),
                        fontSize: 16,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFB5B5B5),
                        size: 24,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _showFilterSheet,
                        icon: const Icon(
                          Icons.tune,
                          color: Color(0xFF777777),
                          size: 21,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Banner section
                SizedBox(
                  height: 132,
                  child: PageView.builder(
                    controller: _bannerController,
                    itemCount: _bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentBanner = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _bannerImages[index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // Banner indicator section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_bannerImages.length, (index) {
                    final isActive = _currentBanner == index;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: isActive ? 10 : 8,
                      height: isActive ? 10 : 8,
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFF9E9E9E)
                            : const Color(0xFFD7D7D7),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 26),

                // Categories section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF4A4A4A),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProductsScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF7367D9),
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(70, 32),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'SHOW ALL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () => _openCategory(_categoryByName(category.name)),
                      child: SizedBox(
                        width: 64,
                        child: Column(
                          children: [
                            Container(
                              width: 54,
                              height: 54,
                              decoration: BoxDecoration(
                                color: category.color,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  category.iconPath,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              category.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFF6D6D6D),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),

                // Featured products section
                const Text(
                  'Featured Products',
                  style: TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 214,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredProducts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return ProductCard(product: featuredProducts[index]);
                    },
                  ),
                ),
                const SizedBox(height: 26),

                // Category wise products section
                ...productCategories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category.title,
                              style: const TextStyle(
                                color: Color(0xFF4A4A4A),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextButton(
                              onPressed: () => _openCategory(category),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF7367D9),
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(62, 30),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'SEE ALL',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 214,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: category.products.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              return ProductCard(
                                product: category.products[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      // Bottom navigation section
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedNavIndex,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: const Color(0xFF7367D9),
        unselectedItemColor: const Color(0xFF9E9E9E),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
