import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Islam 👋',
                        style: AppTextStyles.title,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Welcome to KitWay',
                        style: AppTextStyles.subtitle,
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Search
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for cookware...',
                    hintStyle: AppTextStyles.subtitle,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: const Icon(
                      Icons.tune,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Banner
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Cook Better.\nLive Better.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            'Up to 50% Off',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            height: 32,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                              ),
                              child: const Text(
                                'Shop Now',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.restaurant,
                      size: 80,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Categories title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop by Category',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: AppTextStyles.link,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Categories
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryItem(
                      icon: Icons.soup_kitchen_outlined,
                      title: 'Cookware',
                    ),
                    _categoryItem(
                      icon: Icons.circle_outlined,
                      title: 'Aluminium',
                    ),
                    _categoryItem(
                      icon: Icons.local_fire_department_outlined,
                      title: 'Stainless Steel',
                    ),
                    _categoryItem(
                      icon: Icons.restaurant_outlined,
                      title: 'Chinese',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Featured Products
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Products',
                    style: AppTextStyles.title.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: AppTextStyles.link,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.70,
                ),
                itemBuilder: (context, index) {
                  return _productCard(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryItem({
    required IconData icon,
    required String title,
  }) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 30,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(int index) {
    final products = [
      {
        'name': 'Stainless Steel Cookware Set',
        'price': '1,499 EGP',
        'rating': '4.8',
      },
      {
        'name': 'Pyrex Glass Set',
        'price': '899 EGP',
        'rating': '4.6',
      },
      {
        'name': 'Cast Iron Pan',
        'price': '599 EGP',
        'rating': '4.7',
      },
      {
        'name': 'Stainless Steel Kettle',
        'price': '799 EGP',
        'rating': '4.5',
      },
    ];

    final product = products[index];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.image_outlined,
                size: 60,
                color: AppColors.gray,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            product['name']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            product['price']!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 3),

          Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
                color: Colors.amber,
              ),
              const SizedBox(width: 3),
              Text(
                product['rating']!,
                style: AppTextStyles.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}