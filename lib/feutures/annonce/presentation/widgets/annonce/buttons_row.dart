import 'package:chorakae_project/core/base/widgets/primary_button.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final int activeStep;
  final int upperBound;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onPublish;

  const ButtonsRow({
    required this.activeStep,
    required this.upperBound,
    required this.onPrevious,
    required this.onNext,
    required this.onPublish,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (activeStep > 0)
          Expanded(
            child: PrimaryButton(
              elevation: 0,
              onTap: onPrevious,
              text: 'Previous',
              bgColor: blueColor,
              borderRadius: 20,
              height: context.setHeight(50),
              width: double.infinity,
              textColor: whiteColor,
              fontSize: 14,
            ),
          ),
        // ElevatedButton(
        //   onPressed: onPrevious,
        //   child: const Text("Previous"),
        // ),
        if (activeStep < upperBound)
          Expanded(
            child: PrimaryButton(
              elevation: 0,
              onTap: onNext,
              text: 'Next',
              bgColor: blueColor,
              borderRadius: 20,
              height: context.setHeight(50),
              width: double.infinity,
              textColor: whiteColor,
              fontSize: 14,
            ),
          ),
        // ElevatedButton(
        //   onPressed: onNext,
        //   child: const Text("Next"),
        // ),
        if (activeStep == upperBound)
          Expanded(
            child: PrimaryButton(
              elevation: 0,
              onTap: onPublish,
              text: 'Publish',
              bgColor: blueColor,
              borderRadius: 20,
              height: context.setHeight(50),
              width: double.infinity,
              textColor: whiteColor,
              fontSize: 14,
            ),
          ),
        // ElevatedButton(
        //   onPressed: onPublish,
        //   child: const Text("Publish"),
        // ),
      ],
    );
  }
}
