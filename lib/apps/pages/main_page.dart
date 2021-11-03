import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:refactory_test/apps/pages/home_page.dart';
import 'package:refactory_test/apps/pages/setting_page.dart';
import 'package:refactory_test/apps/pages/todo_page.dart';
import 'package:refactory_test/apps/widget/create_bottom_navigation_item.dart';
import 'package:refactory_test/apps/widget/custom_bottom_navigation_item.dart';
import 'package:refactory_test/cubit/page_cubit.dart';
import 'package:refactory_test/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
    const MainPage({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage(user: _user);
        case 1:
          return TodoPage();
        case 2:
          return SettingPage();
        default:
          return HomePage(user: _user);
      }
    }

    Widget customButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 83,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: kWhiteColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_schedule.png',
                name: 'Task',
              ),
              CreateBottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_plus.png',
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_setting.png',
                name: 'Setting',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}