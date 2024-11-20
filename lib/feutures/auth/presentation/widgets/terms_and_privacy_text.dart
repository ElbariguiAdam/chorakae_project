import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyCheckbox extends StatefulWidget {
  const PrivacyPolicyCheckbox(
      {super.key, required this.firstText, this.secondText});
  final String firstText;
  final String? secondText;

  @override
  PrivacyPolicyCheckboxState createState() => PrivacyPolicyCheckboxState();
}

class PrivacyPolicyCheckboxState extends State<PrivacyPolicyCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: const BorderSide(color: whileColor60),
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: widget.firstText,
                style: Theme.of(context).textTheme.titleSmall,
                children: [
                  widget.secondText != null
                      ? TextSpan(
                          text: widget.secondText,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: blueColor,
                                  ),
                        )
                      : const TextSpan(text: ''),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
