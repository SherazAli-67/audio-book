import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  bool loadingBooks = false;

  List<AudioBookModel> books = [];
  String? error;

  HomeProvider(){
    _initBooks();
  }

  void _initBooks()async {
    loadingBooks = true;
    notifyListeners();

    try{

    }catch(e){
      error = e.toString();
    }finally{
      loadingBooks = false;
      notifyListeners();
    }
  }
}