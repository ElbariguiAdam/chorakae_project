import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:im_stepper/stepper.dart';

class StepperWidget extends StatelessWidget {
  final int activeStep;
  final Function(int) onStepReached;

  const StepperWidget(
      {required this.activeStep, required this.onStepReached, super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<IconData> stepIcons = [
      IconlyLight.edit_square,
      IconlyLight.edit,
      IconlyLight.image,
      Icons.flag,
    ];

    return Container(
      decoration: BoxDecoration(
        color: isDark ? whileColor10 : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconStepper(
        direction: Axis.horizontal,
        enableNextPreviousButtons: false,
        enableStepTapping: true,
        stepColor: isDark ? whileColor20 : whileColor80.withOpacity(0.5),
        activeStepColor: blueColor,
        lineColor: blueColor,
        stepRadius: 20,
        activeStep: activeStep,
        onStepReached: onStepReached,
        icons: List.generate(
          stepIcons.length,
          (index) => Icon(
            index < activeStep ? Icons.check_circle : stepIcons[index],
            color: index < activeStep ? successColor : whiteColor,
          ),
        ),
      ),
    );
  }
}
