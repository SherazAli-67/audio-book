import 'package:audio_book/core/app_icons.dart';
import 'package:audio_book/core/app_textstyles.dart';
import 'package:audio_book/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AudioBookItemWidget extends StatelessWidget{
  const AudioBookItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.push(NamedRoutes.audioBookDetail.routeName),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 14,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: .circular(12),
            child: Image.asset(AppIcons.coverImg, fit: .cover,),
          )),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text("Mobby Dick", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16, fontWeight: .w500),),
              Text("Jeff Vandermer", style: AppTextStyles.regularTextStyle,)
            ],
          )
        ],
      ),
    );
  }
  
}