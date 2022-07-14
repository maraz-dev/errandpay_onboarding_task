import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  final double? height;
  final double? width;
  final String? text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kButtonColor,
      elevation: 1,
      borderRadius: BorderRadius.circular(5),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: kWhite,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height! * 0.025,
            horizontal: height! * 0.03,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                style: const TextStyle(fontSize: 15),
              ),
              SizedBox(width: width! * 0.04),
              const Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
