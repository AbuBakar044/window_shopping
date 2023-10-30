import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ScreenLoader extends StatelessWidget {
  const ScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 15.0,
        shape: const CircleBorder(),
        child: Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
            color: kMainColor,
            shape: BoxShape.circle,
          ),
          child: const Center(
              child: SizedBox(
            height: 25.0,
            width: 25.0,
            child: Center(child: CircularProgressIndicator()),
          )),
        ),
      ),
    );
  }
}
