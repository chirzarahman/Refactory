import 'package:flutter/material.dart';
import 'package:refactory_test/cubit/page_cubit.dart';
import 'package:refactory_test/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int index;

  const CustomBottomNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.index,
    this.name = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kBlueColor
                : kGreyColor,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: bold,
              color: context.read<PageCubit>().state == index
                    ? kBlueColor
                    : kTansparentColor,
            ),
          ),
        ],
      ),
    );
  }
}
