import 'package:audio_book/constants/string_const.dart';
import 'package:audio_book/core/app_colors.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const .only(top: 73.0),
        child: Column(
          children: [
            Padding(
              padding: const .symmetric(horizontal: 50.0),
              child: RichText(
                  textAlign: .center,
                  text: TextSpan(
                text: "Choose Your Favorite ",
                style: AppTextStyles.headingTextStyle.copyWith(fontFamily: StringConst.appFontFamily, fontSize: 40, color: Colors.white),
                children: [
                  TextSpan(
                    text: "Genre",
                    style: AppTextStyles.headingTextStyle.copyWith(fontFamily: StringConst.appFontFamily, fontSize: 40, color: AppColors.primaryColor),
                  )
                ]
              )),
            )
          ],
        ),
      ),
    );
  }
}