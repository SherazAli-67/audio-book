import 'package:flutter/widgets.dart';

class AudioBookDetailProvider extends ChangeNotifier{
  final pageController = PageController();

  bool isPlaying = false;
  void onPlayPauseTap() {
    isPlaying = !isPlaying;
    notifyListeners();
  }


}