import 'package:audio_book/constants/lottie_const.dart';
import 'package:audio_book/core/app_colors.dart';
import 'package:audio_book/core/app_icons.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              ),
              Padding(padding: .only(top: 30), child: Column(
                spacing: 18,
                children: [
                  Row(
                    mainAxisSize: .min,
                    spacing: 17,
                    children: [
                      _buildAudioBookMetaDataWidget(icon: Icons.star_rate_rounded, title: "4.5"),
                      _buildAudioBookMetaDataWidget(icon: Icons.language, title: "English"),
                      _buildAudioBookMetaDataWidget(icon: Icons.mic, title: "2 hrs"),
                    ],
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      Text("Moby Dick", style: AppTextStyles.subHeadingTextStyle,),
                      Text("Herman Melville", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16),)
                    ],
                  )
                ],
              ),),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: .circular(99),
                    color: Colors.black
                ),
                padding: .all(8),
                margin: .only(bottom: 46),
                child: Row(
                  children: [
                    _buildActionButton(icon: AppIcons.icMusic),
                    _buildActionButton(icon: AppIcons.icBackward10s),
                    IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.icPlay), style: IconButton.styleFrom(backgroundColor: AppColors.primaryColor, padding: .all(15)),),
                    _buildActionButton(icon: AppIcons.icForward10s),
                    _buildActionButton(icon: AppIcons.icRepeat),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({required String icon, VoidCallback? onTap}) => Expanded(child: IconButton(onPressed: onTap ?? (){}, icon: SvgPicture.asset(icon),));

  Row _buildAudioBookMetaDataWidget({required IconData icon, required String title}) {
    return Row(
      spacing: 4,
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 20,),
        Text(title, style: AppTextStyles.regularTextStyle,)
      ],
    );
  }
}
