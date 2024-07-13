import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errMsg;
  const CustomErrorWidget({super.key, required this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMsg,
        style: Styles.textSyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
