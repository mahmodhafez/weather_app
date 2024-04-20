import 'package:flutter/widgets.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
    this.text, {
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'JollyLodger',
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.justify,
    );
  }
}
