import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(
          width: 6.3,
        ),
        const Text(
          '4.8',
          style: Styles.textSyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(245))',
          style: Styles.textSyle14.copyWith(
            color: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }
}
