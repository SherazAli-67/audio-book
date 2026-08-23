import 'package:audio_book/constants/string_const.dart';
import 'package:audio_book/core/app_colors.dart';
import 'package:audio_book/core/app_icons.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:audio_book/presentation/widgets/audio_book_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/app_data.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(padding: .only( top: 56), child: Column(
      crossAxisAlignment: .start,
      spacing: 24,
      children: [
        Padding(padding: .symmetric(horizontal: 16,), child: Column(
          crossAxisAlignment: .start,
          spacing: 24,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                ClipOval(
                    child: Image.asset(AppIcons.devProfileImg, height: 45)),
                Container(
                  decoration: BoxDecoration(
                      shape: .circle,
                      color: Colors.black
                  ),
                  padding: .all(14),
                  child: SvgPicture.asset(AppIcons.icNotifications),
                )
              ],
            ),
            RichText(text: TextSpan(
                text: "Hey, ",
                style: AppTextStyles.subHeadingTextStyle.copyWith(
                    fontFamily: StringConst.appFontFamily, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Sheraz!\n",
                    style: AppTextStyles.subHeadingTextStyle.copyWith(
                        fontFamily: StringConst.appFontFamily,
                        color: AppColors.primaryColor),
                  ),
                  TextSpan(
                    text: "What will you listen today?",
                    style: AppTextStyles.subHeadingTextStyle.copyWith(
                        fontFamily: StringConst.appFontFamily,
                        color: Colors.black),
                  ),
                ]
            )),
          ],
        ),),
        Container(
          margin: .only(left: 16),
          height: 47,
          width: .infinity,
          child: ListView.separated(
              scrollDirection: .horizontal,
              itemBuilder: (ctx, index)=> _buildCategoryItemWidget(category: AppData.categories[index], isSelected: _selectedIndex == index, onTap: ()=> _onTabChangeTap(index)), separatorBuilder: (ctx, index) => const SizedBox(width: 10,), itemCount: AppData.categories.length),
        ),
        SizedBox(
          height: size.height*0.35,
          child: Column(
            spacing: 14,
            children: [
              Padding(
                padding: const .symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Drama", style: AppTextStyles.subHeadingTextStyle.copyWith(fontSize: 18),),
                    Text("See all", style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.primaryColor),)
                  ],
                ),
              ),
              Expanded(child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (ctx, index)=> AudioBookItemWidget(), separatorBuilder: (_, _)=> const SizedBox(width: 18,), itemCount: 10))
            ],
          ),
        ),
        SizedBox(
          height: size.height*0.35,
          child: Column(
            spacing: 14,
            children: [
              Padding(
                padding: const .symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text("Detective", style: AppTextStyles.subHeadingTextStyle.copyWith(fontSize: 18),),
                    Text("See all", style: AppTextStyles.regularTextStyle.copyWith(color: AppColors.primaryColor),)
                  ],
                ),
              ),
              Expanded(child: ListView.separated(
                  scrollDirection: .horizontal,
                  itemBuilder: (ctx, index)=> AudioBookItemWidget(), separatorBuilder: (_, _)=> const SizedBox(width: 18,), itemCount: 10))
            ],
          ),
        ),

      ],
    ),);
  }

  void _onTabChangeTap(int index) => setState(() => _selectedIndex = index);

  Widget _buildCategoryItemWidget({required String category, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: .circular(99),
            color: isSelected ? Colors.black : AppColors.categoryBgColor
        ),
        padding: .symmetric(horizontal: 24,),
        alignment: .center,
        child: Text(category, style: AppTextStyles.regularTextStyle.copyWith(color: isSelected ? Colors.white : Colors.black),),
      ),
    );
  }
}