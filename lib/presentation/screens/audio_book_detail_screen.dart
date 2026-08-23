import 'package:audio_book/constants/lottie_const.dart';
import 'package:audio_book/core/app_icons.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AudioBookDetailScreen extends StatelessWidget {
  const AudioBookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(horizontal: 12.0, vertical: 20),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: .circular(100),),),),
                  Text("Details", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16, fontWeight: .w500,),),
                  PopupMenuButton(
                    iconColor: Colors.white,
                    color: Colors.white,
                    elevation: 0,
                    position: .under,
                    borderRadius: .circular(16),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: .circular(100),),),
                    itemBuilder: (_) => [
                      PopupMenuItem(child: Text("Switch to Reading Mode")),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height*0.3,
                child: Stack(
                  alignment: .center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        height: size.height*0.25,
                        width: .infinity,
                        child: Lottie.asset(LottieConst.spinningDisk,),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: ClipRRect(
                        borderRadius: .circular(12),
                        child: Image.asset(AppIcons.coverImg, fit: .cover, height: size.height*0.22,),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
