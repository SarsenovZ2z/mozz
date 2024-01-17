import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.replaceNamed('home');
        }
      },
      radius: 0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(
          'assets/icons/arrow-left.svg',
        ),
      ),
    );
  }
}
