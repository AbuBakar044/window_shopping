import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'my_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function(BuildContext) onExit;
  const CustomAppBar({super.key, required this.title, required this.onExit});

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: kDarkGrey,
        //elevation: 0,
        title: MyText(
          text: title,
          color: kMainColor,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            onExit(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: kMainColor,
          ),
        ),
      ),
    );
  }
}
