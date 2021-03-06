import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int?) onChanged;

  const RadioButtonWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          children: [
            Radio<int>(
              onChanged: onChanged,
              value: value,
              groupValue: groupValue,
              //activeColor: kPrimaryColor,
            ),
            Text(title, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}