import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TextFieldWithTags extends StatefulWidget {
  final StringTagController<String> stringTagController;
  final String hintText;
  final String labelKey;

  const TextFieldWithTags(
      {super.key,
      required this.stringTagController,
      required this.hintText,
      required this.labelKey});

  @override
  State<TextFieldWithTags> createState() => _TextFieldWithTagsState();
}

class _TextFieldWithTagsState extends State<TextFieldWithTags> {
  late StringTagController _stringTagController;

  @override
  void initState() {
    super.initState();
    _stringTagController = widget.stringTagController;
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelKey.tr(context),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isDark ? greyColor : whileColor40,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
        ),
        SizedBox(
          height: context.setHeight(8),
        ),
        TextFieldTags<String>(
          textfieldTagsController: widget.stringTagController,
          initialTags: const [],
          textSeparators: const [' ', ','],
          validator: (String tag) {
            if (_stringTagController.getTags!.contains(tag)) {
              return 'You\'ve already entered that';
            }
            return null;
          },
          inputFieldBuilder: (context, inputFieldValues) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onTap: () {
                  _stringTagController.getFocusNode?.requestFocus();
                },
                controller: inputFieldValues.textEditingController,
                focusNode: inputFieldValues.focusNode,
                decoration: InputDecoration(
                  prefixIcon: inputFieldValues.tags.isNotEmpty
                      ? SingleChildScrollView(
                          controller: inputFieldValues.tagScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 8,
                            ),
                            child: Wrap(
                                runSpacing: 4.0,
                                spacing: 4.0,
                                children:
                                    inputFieldValues.tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: blueColor,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '#$tag',
                                            style: const TextStyle(
                                                color: whiteColor),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                        SizedBox(width: context.setMinSize(4)),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: lightGreyColor,
                                          ),
                                          onTap: () {
                                            inputFieldValues.onTagRemoved(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                          ),
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isDark ? whileColor80 : whileColor60,
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark ? whileColor80 : whileColor80, width: 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDark ? whileColor80 : whileColor80,
                        width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: errorColor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: isDark ? whileColor10 : lightGreyColor,
                ),
                onChanged: inputFieldValues.onTagChanged,
                onSubmitted: inputFieldValues.onTagSubmitted,
              ),
            );
          },
        ),
        SizedBox(
          height: context.setHeight(8),
        ),
      ],
    );
  }
}
