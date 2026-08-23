import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_colors.dart';
import '../../core/app_icons.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            navigationShell,
            Positioned(
              bottom: 0,
              right: 15,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: .circular(99),
                    color: Colors.black
                ),
                padding: .all(8),
                margin: .only(bottom: 46),
                child: Row(
                  children: [
                    _buildBottomNavigationBarItemWidget(context, icon: AppIcons.icHome, index: 0),
                    _buildBottomNavigationBarItemWidget(context,icon: AppIcons.icSearch, index: 1),
                    _buildBottomNavigationBarItemWidget(context,icon: AppIcons.icBookmark, index: 2),
                    _buildBottomNavigationBarItemWidget(context,icon: AppIcons.icProfile, index: 3),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  Widget _buildBottomNavigationBarItemWidget(BuildContext context, {required String icon,required int index,}) => Expanded(child: IconButton(
      onPressed: ()=> navigationShell.goBranch(index),
      icon: SvgPicture.asset(icon, colorFilter: .mode(index == navigationShell.currentIndex ? AppColors.primaryColor : Colors.white, .srcIn), height: 24, width: 24,)));

}