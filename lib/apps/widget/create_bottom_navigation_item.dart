import 'package:flutter/material.dart';
import 'package:refactory_test/cubit/page_cubit.dart';
import 'package:refactory_test/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBottomNavigationItem extends StatelessWidget {
  final int index;
  final String imageUrl;

  const CreateBottomNavigationItem(
      {Key? key, required this.index, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kBlueColor,
        ),
        child: Image.asset(
          imageUrl,
          width: 29,
          height: 29,
        ),
      ),
    );
  }
}
