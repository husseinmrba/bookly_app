import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoind: 'volumes?Filtering=free-ebooks&Sorting=newest&q=flutter',
      );
      List<BookModel> booksList = (data['items'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e))
          .toList();

      return right(booksList);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoind: 'volumes?Filtering=free-ebooks&q=Programming',
      );
      List<BookModel> booksList = (data['items'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e))
          .toList();

      return right(booksList);
    } on DioException catch (e) {
      return left(
        ServerFailure.fromDioException(e),
      );
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
