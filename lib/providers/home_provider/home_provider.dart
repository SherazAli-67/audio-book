import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:audio_book/services/books_service.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier{
  bool loadingBooks = false;

  List<AudioBookModel> dramaBooks = [];
  List<AudioBookModel> historyBooks = [];

  String? error;
  final _audioBooksService = BooksService.instance;

  HomeProvider(){
    _initBooks();
  }

  void _initBooks()async {
    loadingBooks = true;
    notifyListeners();

    try{
      final result =  await Future.wait(
        [
          _audioBooksService.fetchBooksByCategory(category: 'Entrepreneurship'),
          _audioBooksService.fetchBooksByCategory(category: 'History'),
        ]
      );

     dramaBooks = result[0];
     historyBooks = result[1];

    }catch(e){
      error = e.toString();
    }finally{
      loadingBooks = false;
      notifyListeners();
    }
  }
}