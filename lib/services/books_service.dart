import 'package:audio_book/constants/firebase_const.dart';
import 'package:audio_book/core/models/audio_book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BooksService {
  static BooksService? _instance;
  BooksService._internal();

  static BooksService get instance {
    _instance ??= BooksService._internal();
    return _instance!;
  }

  CollectionReference get _booksColRef => FirebaseFirestore.instance.collection(FirebaseConst.booksCollection);

  Future<List<AudioBookModel>> fetchBooksByCategory({required String category})async{
    try{
     final querySnap = await _booksColRef.where('categories', arrayContains: category).limit(10).get();
     return querySnap.docs.map((doc)=> AudioBookModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
    }catch(e){
      throw Exception(e.toString());
    }
  }

}