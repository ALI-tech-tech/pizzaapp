import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController=TextEditingController();
  final emailController=TextEditingController();
  final nameController=TextEditingController();
  final ageController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  IconData iconPassword=CupertinoIcons.eye_fill;
  bool obsecurePassword=true;
  bool signUpRequired=false;
  bool containsUpperCase=false;
  bool containsLowerCase=false;
  bool containsSpecialChar=false;
  bool containsLength=false;


  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBoc,SignUpStat>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          
        }
      },);
  }
}