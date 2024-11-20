import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce/annonce_page.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce/annonce_page_1.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce/annonce_page_2.dart';
import 'package:chorakae_project/feutures/annonce/presentation/screens/annonce/annonce_page_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class StepContent extends StatelessWidget {
  final int activeStep;
  final TextEditingController nomController;
  final QuillController controller;

  const StepContent(
      {required this.activeStep,
      required this.nomController,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (activeStep) {
      case 0:
        return AnnoncePage1(
            nomController: nomController,
            context: context,
            controller: controller);
      case 1:
        return const AnnoncePage2();
      case 2:
        return const AnnoncePage3();
      case 3:
        return const Column(
          children: [
            Expanded(
              child: AnnoncePage(
                isPreview: true,
              ),
            ),
          ],
        );
      default:
        return const Text("Invalid step");
    }
  }
}
