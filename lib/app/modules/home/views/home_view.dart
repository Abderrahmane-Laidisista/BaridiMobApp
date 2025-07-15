import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/home/controllers/home_controller.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';
import 'package:baridimob_app/app/shared/constants/app_dimens.dart';
import 'package:baridimob_app/app/shared/text_styles/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // AppBar مخصص
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBalanceAndActivitiesSection(), // قسم الرصيد والأنشطة
            const SizedBox(height: AppDimens.paddingDefault),
            _buildQuickActionsGrid(), // شبكة الإجراءات السريعة
            const SizedBox(height: AppDimens.paddingDefault),
            // يمكنك إضافة المزيد من الأقسام هنا مثل "العروض" أو "الأخبار"
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // شريط التنقل السفلي
    );
  }

  // Widget مخصص لـ AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryBlue, // لون الـ AppBar من التصميم
      elevation: 0,
      toolbarHeight: Get.height * 0.1, // ارتفاع مخصص للـ AppBar
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingDefault),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // أيقونة القائمة (أو قد تكون صورة ملف شخصي)
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.white),
                onPressed: () {
                  // فتح قائمة جانبية (Drawer) أو الانتقال لصفحة الملف الشخصي
                  // Get.toNamed(Routes.PROFILE);
                },
              ),
              // عنوان التطبيق أو الشعار
              Image.asset(
                'assets/images/logo_white.png', // تأكد من وجود شعار أبيض في المسارات
                height: 40,
              ),
              // أيقونة الإشعارات
              IconButton(
                icon: const Icon(Icons.notifications_none, color: AppColors.white),
                onPressed: () {
                  // Get.toNamed(Routes.NOTIFICATIONS);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget لقسم الرصيد والأنشطة الأخيرة
  Widget _buildBalanceAndActivitiesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.paddingDefault),
      decoration: const BoxDecoration(
        color: AppColors.primaryBlue, // نفس لون الـ AppBar
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(AppDimens.borderRadiusDefault * 2)), // زوايا دائرية سفلية
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppDimens.paddingDefault), // مسافة بعد الـ AppBar
          Text(
            'Current Balance',
            style: AppTextStyles.bodyText2.copyWith(color: AppColors.lightGray), // نمط نص صغير
          ),
          const SizedBox(height: AppDimens.paddingSmall),
          Obx(
            () => Text(
              '${controller.currentBalance.value} DA', // الرصيد من الـ controller
              style: AppTextStyles.headline.copyWith(color: AppColors.white), // نمط عنوان كبير للرصيد
            ),
          ),
          const SizedBox(height: AppDimens.paddingDefault * 1.5),

          // بطاقة الأنشطة الأخيرة (Last Activities)
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingDefault),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last Activities',
                        style: AppTextStyles.title3.copyWith(color: AppColors.darkGray),
                      ),
                      TextButton(
                        onPressed: () {
                          // Get.toNamed(Routes.TRANSACTION_HISTORY); // الانتقال لسجل المعاملات
                        },
                        child: Text(
                          'View All',
                          style: AppTextStyles.bodyText2.copyWith(color: AppColors.primaryBlue),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  // قائمة الأنشطة الأخيرة
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true, // مهم لـ ListView داخل Column/SingleChildScrollView
                      physics: const NeverScrollableScrollPhysics(), // لمنع التمرير الداخلي
                      itemCount: controller.lastActivities.length.clamp(0, 3), // عرض آخر 3 أنشطة فقط
                      itemBuilder: (context, index) {
                        final activity = controller.lastActivities[index];
                        return ListTile(
                          leading: Icon(
                            activity['type'] == 'debit' ? Icons.arrow_downward : Icons.arrow_upward,
                            color: activity['type'] == 'debit' ? AppColors.redAccent : AppColors.greenAccent,
                          ),
                          title: Text(
                            activity['description'],
                            style: AppTextStyles.bodyText1,
                          ),
                          trailing: Text(
                            '${activity['amount']} DA',
                            style: AppTextStyles.bodyText1.copyWith(
                              color: activity['type'] == 'debit' ? AppColors.redAccent : AppColors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            activity['date'],
                            style: AppTextStyles.caption1.copyWith(color: AppColors.mediumGray),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget لشبكة الإجراءات السريعة
  Widget _buildQuickActionsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: AppTextStyles.title3.copyWith(color: AppColors.darkGray),
          ),
          const SizedBox(height: AppDimens.paddingDefault),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 أعمدة
              crossAxisSpacing: AppDimens.paddingDefault,
              mainAxisSpacing: AppDimens.paddingDefault,
              childAspectRatio: 1, // نسبة العرض إلى الارتفاع 1:1
            ),
            itemCount: controller.quickActions.length,
            itemBuilder: (context, index) {
              final action = controller.quickActions[index];
              return _buildQuickActionButton(
                icon: action['icon'] as IconData,
                label: action['label'] as String,
                onTap: action['onTap'] as Function(),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget لزر الإجراء السريع الواحد
  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusDefault),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primaryBlue, size: 30),
            const SizedBox(height: AppDimens.paddingSmall),
            Text(
              label,
              style: AppTextStyles.caption1.copyWith(color: AppColors.darkGray),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // Widget لشريط التنقل السفلي
  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeTabIndex,
        type: BottomNavigationBarType.fixed, // لجعل جميع الأيقونات مرئية
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.mediumGray,
        backgroundColor: AppColors.white,
        selectedLabelStyle: AppTextStyles.caption2,
        unselectedLabelStyle: AppTextStyles.caption2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined), // أو أيقونة التحويل المناسبة
            activeIcon: Icon(Icons.send),
            label: 'Transfer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps_outlined), // أو أيقونة التطبيقات المناسبة
            activeIcon: Icon(Icons.apps),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), // أو أيقونة الحساب المناسبة
            activeIcon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}