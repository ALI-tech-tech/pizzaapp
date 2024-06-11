import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../components/my_text_field.dart';
import '../blocs/sign_up_bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obsecurePassword = true;
  bool signUpRequired = false;
  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool containsLength = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signUpRequired = true;
          });
        } else if (state is SignUpFailure) {
          return;
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                  keyboardType: TextInputType.emailAddress,
                  perfixIcon: const Icon(CupertinoIcons.mail_solid),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Pleas fill in this field";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                        .hasMatch(val)) {
                      return "pleas enter a valid email";
                    }
                    return null;
                  },
                  errorMsg: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: obsecurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  perfixIcon: const Icon(CupertinoIcons.lock_fill),
                  errorMsg: '',
                  onChange: (val) {
                    if (val!.contains(RegExp(r'A-Z'))) {
                      setState(() {
                        containsUpperCase = true;
                      });
                    } else {
                      setState(() {
                        containsUpperCase = false;
                      });
                    }
                    if (val!.contains(RegExp(r'a-z'))) {
                      setState(() {
                        containsLowerCase = true;
                      });
                    } else {
                      setState(() {
                        containsLowerCase = false;
                      });
                    }
                    if (val!.contains(RegExp(r'0-9'))) {
                      setState(() {
                        containsNumber = true;
                      });
                    } else {
                      setState(() {
                        containsNumber = false;
                      });
                    }
                    if (val!.contains(RegExp(
                        r'^(?=.*?[!@#$&*~)\%\-(_+=;:,.<>/?"[{\]}\|^])'))) {
                      setState(() {
                        containsSpecialChar = true;
                      });
                    } else {
                      setState(() {
                        containsSpecialChar = false;
                      });
                    }
                    if (val!.length >= 8) {
                      setState(() {
                        containsLength = true;
                      });
                    } else {
                      setState(() {
                        containsLength = false;
                      });
                    }
                    return '';
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Pleas fill in this field";
                    } else if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                        .hasMatch(val)) {
                      return "pleas enter a valid password";
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePassword = !obsecurePassword;
                          if (obsecurePassword) {
                            iconPassword = CupertinoIcons.eye_fill;
                          } else {
                            iconPassword = CupertinoIcons.eye_slash_fill;
                          }
                        });
                      },
                      icon: Icon(iconPassword)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "* 1 uppercase",
                        style: TextStyle(
                            color: containsUpperCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "* 1 lowercase",
                        style: TextStyle(
                            color: containsLowerCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "* 1 number",
                        style: TextStyle(
                            color: containsNumber
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "* 1 Special Character",
                        style: TextStyle(
                            color: containsSpecialChar
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      Text(
                        "* 8 minimum character",
                        style: TextStyle(
                            color: containsLength
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obsecureText: false,
                  keyboardType: TextInputType.name,
                  perfixIcon: const Icon(CupertinoIcons.person_fill),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Pleas fill in this field";
                    } else if (val.length > 30) {
                      return "Name too long";
                    }
                    return null;
                  },
                  errorMsg: '',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              !signUpRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              MyUser myUser = MyUser.empty;
                              myUser.email = emailController.text;
                              myUser.name = nameController.text;
                              setState(() {
                                context.read<SignUpBloc>().add(SignUpRequired(
                                    myUser, passwordController.text));
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 5),
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
