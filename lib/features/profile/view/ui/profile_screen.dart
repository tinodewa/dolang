import 'package:dolang/features/profile/constants/profile_assets_constant.dart';
import 'package:dolang/features/profile/view/components/log_out_button_component.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final assetsConstant = ProfileAssetsConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogOutButtonComponent(),
      ),
    );
  }
}
