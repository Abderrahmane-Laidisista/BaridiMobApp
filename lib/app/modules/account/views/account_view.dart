import 'package:baridimob_app/app/modules/account/controllers/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Account Screen Content Coming Soon!',
          style: TextStyle(fontSize: 20, color: AppColors.darkGray),
        ),
      ),
    );
  }
}