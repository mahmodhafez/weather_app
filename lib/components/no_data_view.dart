import 'package:flutter/material.dart';

class NoDataViewWidget extends StatelessWidget {
  const NoDataViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There no Info ',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}
