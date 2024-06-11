import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzaapp/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';

import '../../../components/my_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye_fill;
  bool obsecurePassword = true;
  String? _errorMsg="";
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
            _errorMsg = 'Invalid email or password';
          });
        }
      },
      child: Form(
          key: _formKey,
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
                    // perfixIcon: const Icon(CupertinoIcons.mail_solid),
                    errorMsg: _errorMsg!,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Pleas fill in this field";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return "pleas enter a valid email";
                      }
                      return null;
                    }),
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
                  perfixIcon: const Icon(Icons.remove_red_eye_outlined),
                  errorMsg: _errorMsg!,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Pleas fill in this field";
                    }
                    // else if(!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$').hasMatch(val)){
                    //   return "pleas enter a valid password";
                    // }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePassword = !obsecurePassword;
                          if (obsecurePassword) {
                            iconPassword = Icons.remove_red_eye;
                          } else {
                            iconPassword = Icons.remove_red_eye_outlined;
                          }
                        });
                      },
                      icon: Icon(iconPassword)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !signInRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(SignInRequired(
                                  emailController.text,
                                  passwordController.text));
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
                              "Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                          ),
                    )
                  : const CircularProgressIndicator(),
            ],
          )),
    );
  }
}
