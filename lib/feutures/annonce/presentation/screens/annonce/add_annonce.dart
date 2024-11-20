import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/annonce_app_bar.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/buttons_row.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/stepper_content.dart';
import 'package:chorakae_project/feutures/annonce/presentation/widgets/annonce/stepper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AddAnnonce extends StatefulWidget {
  const AddAnnonce({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddAnnonceState createState() => _AddAnnonceState();
}

class _AddAnnonceState extends State<AddAnnonce> {
  int activeStep = 0;
  final int upperBound = 3;
  final TextEditingController nomController = TextEditingController();
  final QuillController _controller = QuillController.basic(
      editorFocusNode: FocusNode(
    canRequestFocus: true,
  ));
  @override
  void dispose() {
    nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            isDark ? Theme.of(context).colorScheme.surface : lightGreyColor,
        appBar: const AnnonceAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              StepperWidget(
                activeStep: activeStep,
                onStepReached: (index) => setState(() => activeStep = index),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    top: context.setMinSize(20),
                  ),
                  padding: EdgeInsets.all(
                    context.setMinSize(15),
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? whileColor10 : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: StepContent(
                    activeStep: activeStep,
                    nomController: nomController,
                    controller: _controller,
                  ),
                ),
              ),
              ButtonsRow(
                activeStep: activeStep,
                upperBound: upperBound,
                onPrevious: () => setState(() => activeStep--),
                onNext: () => setState(() => activeStep++),
                onPublish: () {
                  // Handle publish action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
