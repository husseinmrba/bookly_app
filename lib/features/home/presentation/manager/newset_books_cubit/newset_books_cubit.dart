import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  final HomeRepo _homeRepo;
  NewsetBooksCubit(this._homeRepo) : super(NewsetBooksInitial());

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await _homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.errMsg));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
