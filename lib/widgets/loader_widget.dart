import 'package:flutter/material.dart';

class loaderWidget extends StatelessWidget {
  const loaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: const Center(
          child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70))),
    );
  }
}
