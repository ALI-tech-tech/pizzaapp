import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? perfixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String errorMsg;
  final String Function(String?)? onChange;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText,
      required this.keyboardType,
      this.suffixIcon,
      this.onTap,
      this.perfixIcon,
      this.validator,
      this.focusNode,
      required this.errorMsg,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTap: onTap,
      textInputAction: TextInputAction.next,
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: perfixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        errorText:errorMsg, 
      ),
    );
  }
}
