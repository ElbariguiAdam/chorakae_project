//String Tags with AutoComplete
import 'package:chorakae_project/core/base/blocs/local/app_localization.dart';
import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:chorakae_project/core/responsive_helpers/sizer_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class StringAutoCompleteTags extends StatefulWidget {
  final String labelKey;
  final StringTagController stringTagController;
  final List<String> listItems;
  const StringAutoCompleteTags(
      {super.key,
      required this.labelKey,
      required this.stringTagController,
      required this.listItems});

  @override
  State<StringAutoCompleteTags> createState() => _StringAutoCompleteTagsState();
}

class _StringAutoCompleteTagsState extends State<StringAutoCompleteTags> {
  late double _distanceToField;
  late StringTagController _stringTagController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

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

  static const List<String> _initialTags = <String>[
    "Commerce et affaires",
    "Commerce électronique",
    "Soutien à l'industrie"
  ];

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
        Autocomplete<String>(
          optionsViewBuilder: (context, onSelected, options) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  elevation: 4.0,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return TextButton(
                          onPressed: () {
                            onSelected(option);
                          },
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '#$option',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: blueColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return _initialTags.where((String option) {
              return option.contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selectedTag) {
            _stringTagController.onTagSubmitted(selectedTag);
          },
          fieldViewBuilder:
              (context, textEditingController, focusNode, onFieldSubmitted) {
            return TextFieldTags<String>(
              textEditingController: textEditingController,
              focusNode: focusNode,
              textfieldTagsController: _stringTagController,
              initialTags: const [],
              textSeparators: const [' ', ','],
              letterCase: LetterCase.normal,
              validator: (String tag) {
                if (_stringTagController.getTags!.contains(tag)) {
                  return 'You\'ve already entered that';
                }
                return null;
              },
              inputFieldBuilder: (context, inputFieldValues) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.setMinSize(10)),
                  child: TextField(
                    controller: inputFieldValues.textEditingController,
                    focusNode: inputFieldValues.focusNode,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isDark ? whileColor80 : whileColor80,
                            width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: context.setMinSize(10),
                          vertical: context.setMinSize(14)),
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
                      // helperText: 'Enter entreprise prefere...',
                      // helperStyle: const TextStyle(
                      //   color: whileColor80,
                      // ),
                      filled: true,
                      fillColor: isDark ? whileColor10 : lightGreyColor,
                      hintText: inputFieldValues.tags.isNotEmpty
                          ? ''
                          : widget.labelKey.tr(context),
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: isDark ? whileColor80 : whileColor60,
                              ),
                      errorText: inputFieldValues.error,
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: _distanceToField * 0.74),
                      prefixIcon: inputFieldValues.tags.isNotEmpty
                          ? SingleChildScrollView(
                              controller: inputFieldValues.tagScrollController,
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children:
                                      inputFieldValues.tags.map((String tag) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: context.setMinSize(8)),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color: blueColor,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        const SizedBox(width: 4.0),
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
                                  ),
                                );
                              }).toList()),
                            )
                          : null,
                    ),
                    onChanged: inputFieldValues.onTagChanged,
                    onSubmitted: inputFieldValues.onTagSubmitted,
                  ),
                );
              },
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

List<String> listEntreprisePrefere = [
  "Commerce et affaires",
  "Commerce électronique",
  "Soutien à l'industrie"
];
