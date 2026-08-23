import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/lottie_const.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_textstyles.dart';

class AudioMode extends StatelessWidget{
  const AudioMode({super.key, required this.audioBook, required this.size});
  final AudioBookModel audioBook;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
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
                top: 40,
                child: Hero(
                  tag: audioBook.bookName,
                  child: ClipRRect(
                      borderRadius: .circular(12),
                      child: Image.network(audioBook.image, fit: .cover, height: size.height*0.25,)
                  ),
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
                _buildAudioBookMetaDataWidget(icon: Icons.mic, title: audioBook.time),
              ],
            ),
            Column(
              spacing: 8,
              children: [
                Text(audioBook.bookName, style: AppTextStyles.subHeadingTextStyle,),
                Text(audioBook.author, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16),)
              ],
            )
          ],
        ),),
        const Spacer(),
      ],
    );
  }
  Widget _buildAudioBookMetaDataWidget({required IconData icon, required String title}) {
    return Row(
      spacing: 4,
      children: [
        Icon(icon, color: AppColors.primaryColor, size: 20,),
        Text(title, style: AppTextStyles.regularTextStyle,)
      ],
    );
  }
}