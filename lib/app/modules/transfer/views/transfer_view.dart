import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baridimob_app/app/modules/transfer/controllers/transfer_controller.dart';
import 'package:baridimob_app/app/shared/constants/app_colors.dart'; // إذا كنت ستستخدمها

class TransferView extends GetView<TransferController> {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Money'),
        backgroundColor: AppColors.primaryBlue, // لون مطابق لتصميم الـ app bar
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Transfer Screen Content Coming Soon!',
          style: TextStyle(fontSize: 20, color: AppColors.darkGray),
        ),
      ),
    );
  }
}