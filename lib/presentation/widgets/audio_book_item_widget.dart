import 'package:audio_book/core/app_textstyles.dart';
import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:audio_book/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AudioBookItemWidget extends StatelessWidget{
  const AudioBookItemWidget({super.key, required this.audioBook,});
  final AudioBookModel audioBook;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> context.push(NamedRoutes.audioBookDetail.routeName, extra: audioBook),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 14,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: .circular(12),
            child: Hero(
                tag: audioBook.bookName,
                child: Image.network(audioBook.image, fit: .cover,)),
          )),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(audioBook.bookName, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16, fontWeight: .w500),),
              Text(audioBook.author, style: AppTextStyles.regularTextStyle,)
            ],
          )
        ],
      ),
    );
  }
  
}