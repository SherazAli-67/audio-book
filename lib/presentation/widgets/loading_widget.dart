import 'dart:io';

import 'package:audio_book/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Platform.isIOS ? CupertinoActivityIndicator(color: AppColors.primaryColor,) : CircularProgressIndicator(color: AppColors.primaryColor,),);
  }
}