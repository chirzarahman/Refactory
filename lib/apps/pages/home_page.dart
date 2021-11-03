import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:refactory_test/apps/pages/login_page.dart';
import 'package:refactory_test/apps/widget/date_picker.dart';
import 'package:refactory_test/apps/widget/todoList_item.dart';
import 'package:refactory_test/theme.dart';
import 'package:refactory_test/utils/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Container(
            color: kBlueColor,
            height: 160,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Container(
                        child: ClipOval(
                          child: Material(
                            color: kGreyColor.withOpacity(0.3),
                            child: Image.network(
                              _user.photoURL.toString(),
                              fit: BoxFit.fitHeight,
                              height: 56,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hallo, " + _user.displayName!,
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '2 Task for Today',
                              style: yellowTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            _isSigningOut = true;
                          });
                          await Authentication.signOut(context: context);
                          setState(() {
                            _isSigningOut = false;
                          });
                          Navigator.of(context)
                              .pushReplacement(_routeToSignInScreen());
                        },
                        icon: Icon(
                          Icons.logout,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sun, Sept 14 2020',
                  style: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          DateTimeItem(),
          SizedBox(
            height: 30,
          ),
          //NOTE : TASK LIST
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task List',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                //START TODOLIST
                TodoList(
                  time: '09.00',
                  timeRange: '09-00 - 09.30',
                  title: 'Daily Stand Up',
                  statusBg: 0,
                  statusRange: 0,
                  statusTitle: 0,
                ),
                TodoList(
                  time: '10.00',
                  timeRange: '10.00 - 11.00 ',
                  title: 'Meeting Client A',
                  statusBg: 1,
                  statusRange: 1,
                  statusTitle: 1,
                ),
                TodoList(
                  time: '12.00',
                  timeRange: '12.00 - 13.00 ',
                  title: 'Meeting Client B',
                  statusBg: 2,
                  statusRange: 2,
                  statusTitle: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
