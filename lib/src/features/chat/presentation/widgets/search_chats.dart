import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchChats extends StatelessWidget {
  const SearchChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.onTertiary,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintText: 'Поиск',
        ),
      ),
    );
  }
}
