import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/colors.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    Key? key,
    required TextEditingController controller,
    required this.text,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.height,
    required this.inputType
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;
  final TextInputType inputType;
  final String? text;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(text!, style: kTextStyleFive,),
        ),
        TextFormField(
          controller: _controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, size: 20,),
            hintText: text,
            hintStyle: kTextStyleThree,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(20)
          ),
        ),
        SizedBox(height: height! * 0.05,)
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required TextEditingController controller,
    required this.text,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.height,
    required this.inputType
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;
  final TextInputType inputType;
  final String? text;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final double? height;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = true;
  Icon showPasswordIcon = const Icon(FontAwesomeIcons.eye, size: 18,);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(widget.text!, style: kTextStyleFive,),
        ),
        TextFormField(
          controller: widget._controller,
          keyboardType: widget.inputType,
          obscureText: showPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon, size: 20,),
            hintText: widget.text,
            hintStyle: kTextStyleThree,
            contentPadding: const EdgeInsets.all(20),
            suffixIcon: IconButton(
              onPressed: () {
                if (showPassword == true) {
                  setState(() {
                    showPassword = false;
                    showPasswordIcon = const Icon(FontAwesomeIcons.eyeSlash, size: 18,);
                  });
                } else if (showPassword == false) {
                  setState(() {
                    showPassword = true;
                    showPasswordIcon = const Icon(FontAwesomeIcons.eye, size: 18,);
                  });
                }
              },
              icon: showPasswordIcon,
            ),
          ),
        ),
        SizedBox(height: widget.height! * 0.05,)
      ],
    );
  }
}

