import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:audio_book/core/models/section_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_textstyles.dart';

class ReadingMode extends StatelessWidget{
  const ReadingMode({super.key, required this.audioBook});
  final AudioBookModel audioBook;
  @override
  Widget build(BuildContext context) {
    Section section = audioBook.sections.first;
    return Column(
      spacing: 24,
      children: [
        Expanded(child: SingleChildScrollView(child: Text(section.content, style: AppTextStyles.regularTextStyle.copyWith(fontSize: 16),),))
      ],
    );
  }
}