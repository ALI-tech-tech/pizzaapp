import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzaapp/blocs/authentication_bloc/authentication_bloc.dart';

import 'screens/auth/views/welcom_screen.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Pizza Delvery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary:Colors.blue,
          onPrimary: Colors.white
        )
      ),
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context, state) {
        if (state.sttus==AuthenticationStatus.authenticated) {
          return const HomeScreen();
        }else{
          return const WelcomeScreen();
        }
      },),
      );
  }
}