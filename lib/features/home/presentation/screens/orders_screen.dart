import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class OrdersScreen extends StatefulWidget {
  static const String routeName = 'orders';

  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'My Orders',
          style: AppTextStyles.title,
        ),
      ),

      body: Column(
        children: [
          TabBar(
            controller: tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: 'Current'),
              Tab(text: 'Past'),
              Tab(text: 'Cancelled'),
            ],
          ),

          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                Center(
                  child: Text('Current Orders'),
                ),
                Center(
                  child: Text('Past Orders'),
                ),
                Center(
                  child: Text('Cancelled Orders'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}