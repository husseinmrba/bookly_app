import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: CustomBookImage(imageUrl: 'https://m.media-amazon.com/images/I/71+mhWHnBdL._AC_SY679_.jpg',),
            );
          }),
    );
  }
}
