import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:audio_book/presentation/screens/audio_book_detail/widgets/audio_mode.dart';
import 'package:audio_book/presentation/screens/audio_book_detail/widgets/reading_mode.dart';
import 'package:audio_book/providers/audio_book_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_icons.dart';
import '../../../core/app_textstyles.dart';

class AudioBookDetailScreen extends StatelessWidget {
  const AudioBookDetailScreen({super.key, required this.audioBook});
  final AudioBookModel audioBook;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AudioBookDetailProvider>(context);
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
                    onPressed: () => Navigator.pop(context),
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
                    itemBuilder: (_) => [ PopupMenuItem(child: Text("Switch to Reading Mode")), ],
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: provider.pageController,
                  children: [
                    AudioMode(audioBook: audioBook, size: size),
                    ReadingMode(audioBook: audioBook,)
                  ],
                ),
              ),
              Row(
                spacing: 12,
                children: [
                  Text("00:00", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 12, color: AppColors.inActiveDuration),),
                  Expanded(child: Image.asset(AppIcons.audioWave)),
                  Text("1:00:00", style: AppTextStyles.regularTextStyle.copyWith(fontSize: 12, color: Colors.black),),

                ],
              ),
              Container(
                decoration: BoxDecoration(borderRadius: .circular(99), color: Colors.black),
                padding: .all(8),
                child: Row(
                  children: [
                    _buildActionButton(icon: AppIcons.icMusic),
                    _buildActionButton(icon: AppIcons.icBackward10s),
                    IconButton(onPressed: ()=> provider.onPlayPauseTap(), icon: SvgPicture.asset( provider.isPlaying ? AppIcons.icPause : AppIcons.icPlay), style: IconButton.styleFrom(backgroundColor: provider.isPlaying ? Colors.white : AppColors.primaryColor, padding: .all(15)),),
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
}
