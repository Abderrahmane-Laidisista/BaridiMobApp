import 'package:baridimob_app/app/modules/Applications/controllers/applications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:baridimob_app/app/shared/constants/app_colors.dart';



class ApplicationsView extends GetView<ApplicationsController> {
  const ApplicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applications & Services'),
        backgroundColor: AppColors.primaryBlue,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Applications Screen Content Coming Soon!',
          style: TextStyle(fontSize: 20, color: AppColors.darkGray),
        ),
      ),
    );
  }
}