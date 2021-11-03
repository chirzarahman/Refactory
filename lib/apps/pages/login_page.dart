import 'package:flutter/material.dart';
import 'package:refactory_test/apps/widget/google_sign_in_button.dart';
import 'package:refactory_test/theme.dart';
import 'package:refactory_test/utils/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Refactory Skill Test',
                      style: blueTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'ToDo App',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              //START AUTH SYSTEM
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text('connection state none');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      kBlueColor,
                    ),
                  );
                },
              ),
              //END AUTH SYSTEM
            ],
          ),
        ),
      ),
    );
  }
}