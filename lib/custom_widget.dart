import 'package:flutter/material.dart';

import 'main.dart';

class CustomWidget extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final Widget roundWidgetWithIcon;

  const CustomWidget(
      {super.key,
      required this.titleText,
      required this.subtitleText,
      required this.roundWidgetWithIcon});

  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;

    return SizedBox(
      width: sizeScreen.width * .46,
      child: Column(
        children: [
          roundWidgetWithIcon,
          const SizedBox(height: 10),
          Text(
            titleText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600)
          ),
          const SizedBox(height: 10),
          Text(
            subtitleText,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
