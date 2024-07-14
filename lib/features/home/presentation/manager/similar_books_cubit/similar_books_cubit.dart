import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo _homeRepo;
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());

  Future<void> fetchNewsetBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await _homeRepo.fetchSimilarBooks(
      category: category,
    );
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMsg));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
